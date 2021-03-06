package org.fog.vmmigration;

import org.cloudbus.cloudsim.NetworkTopology;
import org.fog.entities.MobileDevice;
import org.fog.localization.Distances;
import org.fog.vmmobile.AppExample;
import org.fog.vmmobile.constants.Directions;
import org.fog.vmmobile.constants.MaxAndMin;
import org.fog.vmmobile.constants.Policies;

public class MigrationHybrid_Pre_Post implements VmMigrationTechnique {
	private int migPointPolicy;

	public MigrationHybrid_Pre_Post(int migPointPolicy) {
		super();
		setMigPointPolicy(migPointPolicy);
	}

	@Override
	public void verifyPoints(MobileDevice smartThing, int relativePosition) {

		// either (0 or 1) -> policies
		smartThing.setMigPoint(migPointPolicyFunction(getMigPointPolicy()
			, smartThing));// 0 -> fixed or 1 -> with speed
		smartThing.setMigZone(migrationZoneFunction(smartThing.getDirection(), relativePosition));
	}

	@Override
	public double migrationTimeFunction(double vmSize, double bandwidth) {
		// normal Size
		double time = ((double) (vmSize * 8 * 1024 * 1024) / bandwidth) * 1000.0;
		return time;
	}

	@Override
	public boolean migPointPolicyFunction(int policy, MobileDevice smartThing) {
		
		double overload;
		double x =AppExample.getRand().nextDouble()% 0.11;
		int y =(int)(AppExample.getRand().nextDouble()*100.0) % 2;
		
		if (y==0) {
			y=1;
		}else
		{
			y=-1;
		}
		
		overload=1.458+ (x* (double)y);
		
		
		double distance = Distances.checkDistance(smartThing.getSourceAp().getCoord(),
			smartThing.getCoord());
		double bandwidth = smartThing.getVmLocalServerCloudlet().getUplinkBandwidth();

		smartThing
			.setMigTime(migrationTimeFunction(smartThing.getVmMobileDevice().getSize()// vmSize
				, bandwidth)
				* overload
				+ smartThing.getVmLocalServerCloudlet().getUplinkLatency() // Link Latency
				+ NetworkTopology.getDelay(smartThing.getId(), smartThing
					.getVmLocalServerCloudlet().getId())
				+ LatencyByDistance.latencyConnection(smartThing.getVmLocalServerCloudlet(),
					smartThing));
		System.out.println("Container VM " + smartThing.getMigTime() + " size: "
				+ smartThing.getVmMobileDevice().getSize() + " bandwidth: " + bandwidth
				+ " tempo " + migrationTimeFunction(smartThing.getVmMobileDevice().getSize(), bandwidth)
				+ " cloudlet uplink latency " + smartThing.getVmLocalServerCloudlet().getUplinkLatency()
				+ " delay st cloudlet " + NetworkTopology.getDelay(smartThing.getId(), smartThing
					.getVmLocalServerCloudlet().getId()) + " latency distance cloud st "
				+ LatencyByDistance.latencyConnection(smartThing.getVmLocalServerCloudlet(),
					smartThing));
		if (policy == Policies.FIXED_MIGRATION_POINT) {
			return migrationPointFunction(distance);
		}
		else {
			// relative according smartThing's speed
			return migrationPointFunction(distance, smartThing.getMigTime(), smartThing.getSpeed());
		}
	}

	@Override
	public boolean migrationPointFunction(double distance, double migTime,
		int speed) {
		// ((migTime/1000.0) * speed);//minimal distance to migration
		double newDistance = (double) (migTime / 1000.0) * speed;
		newDistance += MaxAndMin.MIG_POINT;
		if ((distance >= MaxAndMin.AP_COVERAGE - newDistance || distance >= MaxAndMin.AP_COVERAGE
			- MaxAndMin.MAX_DISTANCE_TO_HANDOFF) && distance < MaxAndMin.AP_COVERAGE)
			return true;
		else
			return false;
	}

	@Override
	public boolean migrationPointFunction(double distance) {

		// Right now it is not consider the user's speed -> it is a fixed point
		if (distance >= MaxAndMin.AP_COVERAGE - MaxAndMin.LIVE_MIG_POINT &&
			distance < MaxAndMin.AP_COVERAGE)
			return true;
		else
			return false;
	}

	@Override
	public boolean migrationZoneFunction(int smartThingDirection,
		int zoneDirection) {

		int ajust1, ajust2;

		if (smartThingDirection == Directions.EAST) {
			ajust1 = Directions.SOUTHEAST;
			ajust2 = Directions.EAST + 1;
		}
		else if (smartThingDirection == Directions.SOUTHEAST) {
			ajust1 = Directions.SOUTHEAST - 1;
			ajust2 = Directions.EAST;
		}
		else {
			ajust1 = smartThingDirection - 1; /* plus 45 degree */
			ajust2 = smartThingDirection + 1;
		}

		//Define Migration Zone -> it looks for 135 * degree = 45 way + 45 way1 +45 way2
		if (zoneDirection == smartThingDirection ||
			zoneDirection == ajust1 || zoneDirection == ajust2)
			return true;
		else
			return false;
	}

	public int getMigPointPolicy() {
		return migPointPolicy;
	}

	public void setMigPointPolicy(int migPointPolicy) {
		this.migPointPolicy = migPointPolicy;
	}

}
