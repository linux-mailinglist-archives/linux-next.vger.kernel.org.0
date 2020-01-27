Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 96B8814AB44
	for <lists+linux-next@lfdr.de>; Mon, 27 Jan 2020 21:46:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726080AbgA0Uqk (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 27 Jan 2020 15:46:40 -0500
Received: from ozlabs.org ([203.11.71.1]:45887 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725955AbgA0Uqk (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 27 Jan 2020 15:46:40 -0500
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4861xh6CRDz9sP6;
        Tue, 28 Jan 2020 07:46:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1580157993;
        bh=eSsVbdWDTSjv4RB7alI2J18nsz0mpzlSC6nPN7gdicc=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=uAqABfQ8s4eZt0o5T5FKIXJ8VyX5tngJbUzvxO1AELGpYuK1Snwe84g+5859AxSbA
         NqOKRESctOSEIVPxIsQSYvCr2EsvL40G+wybGNLrPIkpPR2kEPXFuUDGqwOvtHoid2
         NvxvX1vxN61wkjOlApBrhGBlzzAixFe+g8govTFQG+cDDIR4uMR+2ZzwE7EtfUsAaD
         +cGBK0LCeJR9kfL2S2gq2cnCY8ByDtJuLLbiefiU3i3J+L+T+fDgHohMnEd7Pp5drB
         4B38TlA5wgoLTPFvkxb9SB3NSz7uc+kUacLYmQOazZ8GCQgkotZBNanyhyMJZuZNC2
         qJjtndFLeAE1g==
Date:   Tue, 28 Jan 2020 07:46:27 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Greg KH <greg@kroah.com>, David Howells <dhowells@redhat.com>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: linux-next: manual merge of the driver-core tree with the keys
 tree
Message-ID: <20200128074627.4970eaa5@canb.auug.org.au>
In-Reply-To: <20191220134539.38872256@canb.auug.org.au>
References: <20191220134539.38872256@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/F8dOWibFgswRmD67=9fgVe_";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/F8dOWibFgswRmD67=9fgVe_
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Fri, 20 Dec 2019 13:45:39 +1100 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> Today's linux-next merge of the driver-core tree got a conflict in:
>=20
>   include/linux/device.h
>=20
> between commit:
>=20
>   3a92c6e49c47 ("Add a general, global device notification watch list")
>=20
> from the (20191211 version of the) keys tree and commit:
>=20
>   af628aae8640 ("device.h: move dev_printk()-like functions to dev_printk=
.h")
>=20
> from the driver-core tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> 85a7a99c22826b8241ed020a2921f7610682b05c
> diff --cc include/linux/device.h
> index f32de6466092,0cd7c647c16c..ce6db68c3f29
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@@ -43,492 -45,7 +45,8 @@@ struct iommu_group
>   struct iommu_fwspec;
>   struct dev_pin_info;
>   struct iommu_param;
>  +struct watch_notification;
>  =20
> - struct bus_attribute {
> - 	struct attribute	attr;
> - 	ssize_t (*show)(struct bus_type *bus, char *buf);
> - 	ssize_t (*store)(struct bus_type *bus, const char *buf, size_t count);
> - };
> -=20
> - #define BUS_ATTR_RW(_name) \
> - 	struct bus_attribute bus_attr_##_name =3D __ATTR_RW(_name)
> - #define BUS_ATTR_RO(_name) \
> - 	struct bus_attribute bus_attr_##_name =3D __ATTR_RO(_name)
> - #define BUS_ATTR_WO(_name) \
> - 	struct bus_attribute bus_attr_##_name =3D __ATTR_WO(_name)
> -=20
> - extern int __must_check bus_create_file(struct bus_type *,
> - 					struct bus_attribute *);
> - extern void bus_remove_file(struct bus_type *, struct bus_attribute *);
> -=20
> - /**
> -  * struct bus_type - The bus type of the device
> -  *
> -  * @name:	The name of the bus.
> -  * @dev_name:	Used for subsystems to enumerate devices like ("foo%u", d=
ev->id).
> -  * @dev_root:	Default device to use as the parent.
> -  * @bus_groups:	Default attributes of the bus.
> -  * @dev_groups:	Default attributes of the devices on the bus.
> -  * @drv_groups: Default attributes of the device drivers on the bus.
> -  * @match:	Called, perhaps multiple times, whenever a new device or dri=
ver
> -  *		is added for this bus. It should return a positive value if the
> -  *		given device can be handled by the given driver and zero
> -  *		otherwise. It may also return error code if determining that
> -  *		the driver supports the device is not possible. In case of
> -  *		-EPROBE_DEFER it will queue the device for deferred probing.
> -  * @uevent:	Called when a device is added, removed, or a few other thin=
gs
> -  *		that generate uevents to add the environment variables.
> -  * @probe:	Called when a new device or driver add to this bus, and call=
back
> -  *		the specific driver's probe to initial the matched device.
> -  * @sync_state:	Called to sync device state to software state after all=
 the
> -  *		state tracking consumers linked to this device (present at
> -  *		the time of late_initcall) have successfully bound to a
> -  *		driver. If the device has no consumers, this function will
> -  *		be called at late_initcall_sync level. If the device has
> -  *		consumers that are never bound to a driver, this function
> -  *		will never get called until they do.
> -  * @remove:	Called when a device removed from this bus.
> -  * @shutdown:	Called at shut-down time to quiesce the device.
> -  *
> -  * @online:	Called to put the device back online (after offlining it).
> -  * @offline:	Called to put the device offline for hot-removal. May fail.
> -  *
> -  * @suspend:	Called when a device on this bus wants to go to sleep mode.
> -  * @resume:	Called to bring a device on this bus out of sleep mode.
> -  * @num_vf:	Called to find out how many virtual functions a device on t=
his
> -  *		bus supports.
> -  * @dma_configure:	Called to setup DMA configuration on a device on
> -  *			this bus.
> -  * @pm:		Power management operations of this bus, callback the specific
> -  *		device driver's pm-ops.
> -  * @iommu_ops:  IOMMU specific operations for this bus, used to attach =
IOMMU
> -  *              driver implementations to a bus and allow the driver to=
 do
> -  *              bus-specific setup
> -  * @p:		The private data of the driver core, only the driver core can
> -  *		touch this.
> -  * @lock_key:	Lock class key for use by the lock validator
> -  * @need_parent_lock:	When probing or removing a device on this bus, the
> -  *			device core should lock the device's parent.
> -  *
> -  * A bus is a channel between the processor and one or more devices. Fo=
r the
> -  * purposes of the device model, all devices are connected via a bus, e=
ven if
> -  * it is an internal, virtual, "platform" bus. Buses can plug into each=
 other.
> -  * A USB controller is usually a PCI device, for example. The device mo=
del
> -  * represents the actual connections between buses and the devices they=
 control.
> -  * A bus is represented by the bus_type structure. It contains the name=
, the
> -  * default attributes, the bus' methods, PM operations, and the driver =
core's
> -  * private data.
> -  */
> - struct bus_type {
> - 	const char		*name;
> - 	const char		*dev_name;
> - 	struct device		*dev_root;
> - 	const struct attribute_group **bus_groups;
> - 	const struct attribute_group **dev_groups;
> - 	const struct attribute_group **drv_groups;
> -=20
> - 	int (*match)(struct device *dev, struct device_driver *drv);
> - 	int (*uevent)(struct device *dev, struct kobj_uevent_env *env);
> - 	int (*probe)(struct device *dev);
> - 	void (*sync_state)(struct device *dev);
> - 	int (*remove)(struct device *dev);
> - 	void (*shutdown)(struct device *dev);
> -=20
> - 	int (*online)(struct device *dev);
> - 	int (*offline)(struct device *dev);
> -=20
> - 	int (*suspend)(struct device *dev, pm_message_t state);
> - 	int (*resume)(struct device *dev);
> -=20
> - 	int (*num_vf)(struct device *dev);
> -=20
> - 	int (*dma_configure)(struct device *dev);
> -=20
> - 	const struct dev_pm_ops *pm;
> -=20
> - 	const struct iommu_ops *iommu_ops;
> -=20
> - 	struct subsys_private *p;
> - 	struct lock_class_key lock_key;
> -=20
> - 	bool need_parent_lock;
> - };
> -=20
> - extern int __must_check bus_register(struct bus_type *bus);
> -=20
> - extern void bus_unregister(struct bus_type *bus);
> -=20
> - extern int __must_check bus_rescan_devices(struct bus_type *bus);
> -=20
> - /* iterator helpers for buses */
> - struct subsys_dev_iter {
> - 	struct klist_iter		ki;
> - 	const struct device_type	*type;
> - };
> - void subsys_dev_iter_init(struct subsys_dev_iter *iter,
> - 			 struct bus_type *subsys,
> - 			 struct device *start,
> - 			 const struct device_type *type);
> - struct device *subsys_dev_iter_next(struct subsys_dev_iter *iter);
> - void subsys_dev_iter_exit(struct subsys_dev_iter *iter);
> -=20
> - int device_match_name(struct device *dev, const void *name);
> - int device_match_of_node(struct device *dev, const void *np);
> - int device_match_fwnode(struct device *dev, const void *fwnode);
> - int device_match_devt(struct device *dev, const void *pdevt);
> - int device_match_acpi_dev(struct device *dev, const void *adev);
> - int device_match_any(struct device *dev, const void *unused);
> -=20
> - int bus_for_each_dev(struct bus_type *bus, struct device *start, void *=
data,
> - 		     int (*fn)(struct device *dev, void *data));
> - struct device *bus_find_device(struct bus_type *bus, struct device *sta=
rt,
> - 			       const void *data,
> - 			       int (*match)(struct device *dev, const void *data));
> - /**
> -  * bus_find_device_by_name - device iterator for locating a particular =
device
> -  * of a specific name.
> -  * @bus: bus type
> -  * @start: Device to begin with
> -  * @name: name of the device to match
> -  */
> - static inline struct device *bus_find_device_by_name(struct bus_type *b=
us,
> - 						     struct device *start,
> - 						     const char *name)
> - {
> - 	return bus_find_device(bus, start, name, device_match_name);
> - }
> -=20
> - /**
> -  * bus_find_device_by_of_node : device iterator for locating a particul=
ar device
> -  * matching the of_node.
> -  * @bus: bus type
> -  * @np: of_node of the device to match.
> -  */
> - static inline struct device *
> - bus_find_device_by_of_node(struct bus_type *bus, const struct device_no=
de *np)
> - {
> - 	return bus_find_device(bus, NULL, np, device_match_of_node);
> - }
> -=20
> - /**
> -  * bus_find_device_by_fwnode : device iterator for locating a particula=
r device
> -  * matching the fwnode.
> -  * @bus: bus type
> -  * @fwnode: fwnode of the device to match.
> -  */
> - static inline struct device *
> - bus_find_device_by_fwnode(struct bus_type *bus, const struct fwnode_han=
dle *fwnode)
> - {
> - 	return bus_find_device(bus, NULL, fwnode, device_match_fwnode);
> - }
> -=20
> - /**
> -  * bus_find_device_by_devt : device iterator for locating a particular =
device
> -  * matching the device type.
> -  * @bus: bus type
> -  * @devt: device type of the device to match.
> -  */
> - static inline struct device *bus_find_device_by_devt(struct bus_type *b=
us,
> - 						     dev_t devt)
> - {
> - 	return bus_find_device(bus, NULL, &devt, device_match_devt);
> - }
> -=20
> - /**
> -  * bus_find_next_device - Find the next device after a given device in a
> -  * given bus.
> -  * @bus: bus type
> -  * @cur: device to begin the search with.
> -  */
> - static inline struct device *
> - bus_find_next_device(struct bus_type *bus,struct device *cur)
> - {
> - 	return bus_find_device(bus, cur, NULL, device_match_any);
> - }
> -=20
> - #ifdef CONFIG_ACPI
> - struct acpi_device;
> -=20
> - /**
> -  * bus_find_device_by_acpi_dev : device iterator for locating a particu=
lar device
> -  * matching the ACPI COMPANION device.
> -  * @bus: bus type
> -  * @adev: ACPI COMPANION device to match.
> -  */
> - static inline struct device *
> - bus_find_device_by_acpi_dev(struct bus_type *bus, const struct acpi_dev=
ice *adev)
> - {
> - 	return bus_find_device(bus, NULL, adev, device_match_acpi_dev);
> - }
> - #else
> - static inline struct device *
> - bus_find_device_by_acpi_dev(struct bus_type *bus, const void *adev)
> - {
> - 	return NULL;
> - }
> - #endif
> -=20
> - struct device *subsys_find_device_by_id(struct bus_type *bus, unsigned =
int id,
> - 					struct device *hint);
> - int bus_for_each_drv(struct bus_type *bus, struct device_driver *start,
> - 		     void *data, int (*fn)(struct device_driver *, void *));
> - void bus_sort_breadthfirst(struct bus_type *bus,
> - 			   int (*compare)(const struct device *a,
> - 					  const struct device *b));
> - /*
> -  * Bus notifiers: Get notified of addition/removal of devices
> -  * and binding/unbinding of drivers to devices.
> -  * In the long run, it should be a replacement for the platform
> -  * notify hooks.
> -  */
> - struct notifier_block;
> -=20
> - extern int bus_register_notifier(struct bus_type *bus,
> - 				 struct notifier_block *nb);
> - extern int bus_unregister_notifier(struct bus_type *bus,
> - 				   struct notifier_block *nb);
> -=20
> - /* All 4 notifers below get called with the target struct device *
> -  * as an argument. Note that those functions are likely to be called
> -  * with the device lock held in the core, so be careful.
> -  */
> - #define BUS_NOTIFY_ADD_DEVICE		0x00000001 /* device added */
> - #define BUS_NOTIFY_DEL_DEVICE		0x00000002 /* device to be removed */
> - #define BUS_NOTIFY_REMOVED_DEVICE	0x00000003 /* device removed */
> - #define BUS_NOTIFY_BIND_DRIVER		0x00000004 /* driver about to be
> - 						      bound */
> - #define BUS_NOTIFY_BOUND_DRIVER		0x00000005 /* driver bound to device */
> - #define BUS_NOTIFY_UNBIND_DRIVER	0x00000006 /* driver about to be
> - 						      unbound */
> - #define BUS_NOTIFY_UNBOUND_DRIVER	0x00000007 /* driver is unbound
> - 						      from the device */
> - #define BUS_NOTIFY_DRIVER_NOT_BOUND	0x00000008 /* driver fails to be bo=
und */
> -=20
> - extern struct kset *bus_get_kset(struct bus_type *bus);
> - extern struct klist *bus_get_device_klist(struct bus_type *bus);
> -=20
> - /**
> -  * enum probe_type - device driver probe type to try
> -  *	Device drivers may opt in for special handling of their
> -  *	respective probe routines. This tells the core what to
> -  *	expect and prefer.
> -  *
> -  * @PROBE_DEFAULT_STRATEGY: Used by drivers that work equally well
> -  *	whether probed synchronously or asynchronously.
> -  * @PROBE_PREFER_ASYNCHRONOUS: Drivers for "slow" devices which
> -  *	probing order is not essential for booting the system may
> -  *	opt into executing their probes asynchronously.
> -  * @PROBE_FORCE_SYNCHRONOUS: Use this to annotate drivers that need
> -  *	their probe routines to run synchronously with driver and
> -  *	device registration (with the exception of -EPROBE_DEFER
> -  *	handling - re-probing always ends up being done asynchronously).
> -  *
> -  * Note that the end goal is to switch the kernel to use asynchronous
> -  * probing by default, so annotating drivers with
> -  * %PROBE_PREFER_ASYNCHRONOUS is a temporary measure that allows us
> -  * to speed up boot process while we are validating the rest of the
> -  * drivers.
> -  */
> - enum probe_type {
> - 	PROBE_DEFAULT_STRATEGY,
> - 	PROBE_PREFER_ASYNCHRONOUS,
> - 	PROBE_FORCE_SYNCHRONOUS,
> - };
> -=20
> - /**
> -  * struct device_driver - The basic device driver structure
> -  * @name:	Name of the device driver.
> -  * @bus:	The bus which the device of this driver belongs to.
> -  * @owner:	The module owner.
> -  * @mod_name:	Used for built-in modules.
> -  * @suppress_bind_attrs: Disables bind/unbind via sysfs.
> -  * @probe_type:	Type of the probe (synchronous or asynchronous) to use.
> -  * @of_match_table: The open firmware table.
> -  * @acpi_match_table: The ACPI match table.
> -  * @probe:	Called to query the existence of a specific device,
> -  *		whether this driver can work with it, and bind the driver
> -  *		to a specific device.
> -  * @sync_state:	Called to sync device state to software state after all=
 the
> -  *		state tracking consumers linked to this device (present at
> -  *		the time of late_initcall) have successfully bound to a
> -  *		driver. If the device has no consumers, this function will
> -  *		be called at late_initcall_sync level. If the device has
> -  *		consumers that are never bound to a driver, this function
> -  *		will never get called until they do.
> -  * @remove:	Called when the device is removed from the system to
> -  *		unbind a device from this driver.
> -  * @shutdown:	Called at shut-down time to quiesce the device.
> -  * @suspend:	Called to put the device to sleep mode. Usually to a
> -  *		low power state.
> -  * @resume:	Called to bring a device from sleep mode.
> -  * @groups:	Default attributes that get created by the driver core
> -  *		automatically.
> -  * @dev_groups:	Additional attributes attached to device instance once =
the
> -  *		it is bound to the driver.
> -  * @pm:		Power management operations of the device which matched
> -  *		this driver.
> -  * @coredump:	Called when sysfs entry is written to. The device driver
> -  *		is expected to call the dev_coredump API resulting in a
> -  *		uevent.
> -  * @p:		Driver core's private data, no one other than the driver
> -  *		core can touch this.
> -  *
> -  * The device driver-model tracks all of the drivers known to the syste=
m.
> -  * The main reason for this tracking is to enable the driver core to ma=
tch
> -  * up drivers with new devices. Once drivers are known objects within t=
he
> -  * system, however, a number of other things become possible. Device dr=
ivers
> -  * can export information and configuration variables that are independ=
ent
> -  * of any specific device.
> -  */
> - struct device_driver {
> - 	const char		*name;
> - 	struct bus_type		*bus;
> -=20
> - 	struct module		*owner;
> - 	const char		*mod_name;	/* used for built-in modules */
> -=20
> - 	bool suppress_bind_attrs;	/* disables bind/unbind via sysfs */
> - 	enum probe_type probe_type;
> -=20
> - 	const struct of_device_id	*of_match_table;
> - 	const struct acpi_device_id	*acpi_match_table;
> -=20
> - 	int (*probe) (struct device *dev);
> - 	void (*sync_state)(struct device *dev);
> - 	int (*remove) (struct device *dev);
> - 	void (*shutdown) (struct device *dev);
> - 	int (*suspend) (struct device *dev, pm_message_t state);
> - 	int (*resume) (struct device *dev);
> - 	const struct attribute_group **groups;
> - 	const struct attribute_group **dev_groups;
> -=20
> - 	const struct dev_pm_ops *pm;
> - 	void (*coredump) (struct device *dev);
> -=20
> - 	struct driver_private *p;
> - };
> -=20
> -=20
> - extern int __must_check driver_register(struct device_driver *drv);
> - extern void driver_unregister(struct device_driver *drv);
> -=20
> - extern struct device_driver *driver_find(const char *name,
> - 					 struct bus_type *bus);
> - extern int driver_probe_done(void);
> - extern void wait_for_device_probe(void);
> -=20
> - /* sysfs interface for exporting driver attributes */
> -=20
> - struct driver_attribute {
> - 	struct attribute attr;
> - 	ssize_t (*show)(struct device_driver *driver, char *buf);
> - 	ssize_t (*store)(struct device_driver *driver, const char *buf,
> - 			 size_t count);
> - };
> -=20
> - #define DRIVER_ATTR_RW(_name) \
> - 	struct driver_attribute driver_attr_##_name =3D __ATTR_RW(_name)
> - #define DRIVER_ATTR_RO(_name) \
> - 	struct driver_attribute driver_attr_##_name =3D __ATTR_RO(_name)
> - #define DRIVER_ATTR_WO(_name) \
> - 	struct driver_attribute driver_attr_##_name =3D __ATTR_WO(_name)
> -=20
> - extern int __must_check driver_create_file(struct device_driver *driver,
> - 					const struct driver_attribute *attr);
> - extern void driver_remove_file(struct device_driver *driver,
> - 			       const struct driver_attribute *attr);
> -=20
> - extern int __must_check driver_for_each_device(struct device_driver *dr=
v,
> - 					       struct device *start,
> - 					       void *data,
> - 					       int (*fn)(struct device *dev,
> - 							 void *));
> - struct device *driver_find_device(struct device_driver *drv,
> - 				  struct device *start, const void *data,
> - 				  int (*match)(struct device *dev, const void *data));
> -=20
> - /**
> -  * driver_find_device_by_name - device iterator for locating a particul=
ar device
> -  * of a specific name.
> -  * @drv: the driver we're iterating
> -  * @name: name of the device to match
> -  */
> - static inline struct device *driver_find_device_by_name(struct device_d=
river *drv,
> - 							const char *name)
> - {
> - 	return driver_find_device(drv, NULL, name, device_match_name);
> - }
> -=20
> - /**
> -  * driver_find_device_by_of_node- device iterator for locating a partic=
ular device
> -  * by of_node pointer.
> -  * @drv: the driver we're iterating
> -  * @np: of_node pointer to match.
> -  */
> - static inline struct device *
> - driver_find_device_by_of_node(struct device_driver *drv,
> - 			      const struct device_node *np)
> - {
> - 	return driver_find_device(drv, NULL, np, device_match_of_node);
> - }
> -=20
> - /**
> -  * driver_find_device_by_fwnode- device iterator for locating a particu=
lar device
> -  * by fwnode pointer.
> -  * @drv: the driver we're iterating
> -  * @fwnode: fwnode pointer to match.
> -  */
> - static inline struct device *
> - driver_find_device_by_fwnode(struct device_driver *drv,
> - 			     const struct fwnode_handle *fwnode)
> - {
> - 	return driver_find_device(drv, NULL, fwnode, device_match_fwnode);
> - }
> -=20
> - /**
> -  * driver_find_device_by_devt- device iterator for locating a particula=
r device
> -  * by devt.
> -  * @drv: the driver we're iterating
> -  * @devt: devt pointer to match.
> -  */
> - static inline struct device *driver_find_device_by_devt(struct device_d=
river *drv,
> - 							dev_t devt)
> - {
> - 	return driver_find_device(drv, NULL, &devt, device_match_devt);
> - }
> -=20
> - static inline struct device *driver_find_next_device(struct device_driv=
er *drv,
> - 						     struct device *start)
> - {
> - 	return driver_find_device(drv, start, NULL, device_match_any);
> - }
> -=20
> - #ifdef CONFIG_ACPI
> - /**
> -  * driver_find_device_by_acpi_dev : device iterator for locating a part=
icular
> -  * device matching the ACPI_COMPANION device.
> -  * @drv: the driver we're iterating
> -  * @adev: ACPI_COMPANION device to match.
> -  */
> - static inline struct device *
> - driver_find_device_by_acpi_dev(struct device_driver *drv,
> - 			       const struct acpi_device *adev)
> - {
> - 	return driver_find_device(drv, NULL, adev, device_match_acpi_dev);
> - }
> - #else
> - static inline struct device *
> - driver_find_device_by_acpi_dev(struct device_driver *drv, const void *a=
dev)
> - {
> - 	return NULL;
> - }
> - #endif
> -=20
> - void driver_deferred_probe_add(struct device *dev);
> - int driver_deferred_probe_check_state(struct device *dev);
> - int driver_deferred_probe_check_state_continue(struct device *dev);
> -=20
>   /**
>    * struct subsys_interface - interfaces to device functions
>    * @name:       name of the device function
> @@@ -1688,227 -959,6 +960,12 @@@ void device_link_remove(void *consumer
>   void device_links_supplier_sync_state_pause(void);
>   void device_links_supplier_sync_state_resume(void);
>  =20
>  +#ifdef CONFIG_DEVICE_NOTIFICATIONS
>  +extern void post_device_notification(struct watch_notification *n, u64 =
id);
>  +#else
>  +static inline void post_device_notification(struct watch_notification *=
n, u64 id) {}
>  +#endif
>  +
> - #ifndef dev_fmt
> - #define dev_fmt(fmt) fmt
> - #endif
> -=20
> - #ifdef CONFIG_PRINTK
> -=20
> - __printf(3, 0) __cold
> - int dev_vprintk_emit(int level, const struct device *dev,
> - 		     const char *fmt, va_list args);
> - __printf(3, 4) __cold
> - int dev_printk_emit(int level, const struct device *dev, const char *fm=
t, ...);
> -=20
> - __printf(3, 4) __cold
> - void dev_printk(const char *level, const struct device *dev,
> - 		const char *fmt, ...);
> - __printf(2, 3) __cold
> - void _dev_emerg(const struct device *dev, const char *fmt, ...);
> - __printf(2, 3) __cold
> - void _dev_alert(const struct device *dev, const char *fmt, ...);
> - __printf(2, 3) __cold
> - void _dev_crit(const struct device *dev, const char *fmt, ...);
> - __printf(2, 3) __cold
> - void _dev_err(const struct device *dev, const char *fmt, ...);
> - __printf(2, 3) __cold
> - void _dev_warn(const struct device *dev, const char *fmt, ...);
> - __printf(2, 3) __cold
> - void _dev_notice(const struct device *dev, const char *fmt, ...);
> - __printf(2, 3) __cold
> - void _dev_info(const struct device *dev, const char *fmt, ...);
> -=20
> - #else
> -=20
> - static inline __printf(3, 0)
> - int dev_vprintk_emit(int level, const struct device *dev,
> - 		     const char *fmt, va_list args)
> - { return 0; }
> - static inline __printf(3, 4)
> - int dev_printk_emit(int level, const struct device *dev, const char *fm=
t, ...)
> - { return 0; }
> -=20
> - static inline void __dev_printk(const char *level, const struct device =
*dev,
> - 				struct va_format *vaf)
> - {}
> - static inline __printf(3, 4)
> - void dev_printk(const char *level, const struct device *dev,
> - 		 const char *fmt, ...)
> - {}
> -=20
> - static inline __printf(2, 3)
> - void _dev_emerg(const struct device *dev, const char *fmt, ...)
> - {}
> - static inline __printf(2, 3)
> - void _dev_crit(const struct device *dev, const char *fmt, ...)
> - {}
> - static inline __printf(2, 3)
> - void _dev_alert(const struct device *dev, const char *fmt, ...)
> - {}
> - static inline __printf(2, 3)
> - void _dev_err(const struct device *dev, const char *fmt, ...)
> - {}
> - static inline __printf(2, 3)
> - void _dev_warn(const struct device *dev, const char *fmt, ...)
> - {}
> - static inline __printf(2, 3)
> - void _dev_notice(const struct device *dev, const char *fmt, ...)
> - {}
> - static inline __printf(2, 3)
> - void _dev_info(const struct device *dev, const char *fmt, ...)
> - {}
> -=20
> - #endif
> -=20
> - /*
> -  * #defines for all the dev_<level> macros to prefix with whatever
> -  * possible use of #define dev_fmt(fmt) ...
> -  */
> -=20
> - #define dev_emerg(dev, fmt, ...)					\
> - 	_dev_emerg(dev, dev_fmt(fmt), ##__VA_ARGS__)
> - #define dev_crit(dev, fmt, ...)						\
> - 	_dev_crit(dev, dev_fmt(fmt), ##__VA_ARGS__)
> - #define dev_alert(dev, fmt, ...)					\
> - 	_dev_alert(dev, dev_fmt(fmt), ##__VA_ARGS__)
> - #define dev_err(dev, fmt, ...)						\
> - 	_dev_err(dev, dev_fmt(fmt), ##__VA_ARGS__)
> - #define dev_warn(dev, fmt, ...)						\
> - 	_dev_warn(dev, dev_fmt(fmt), ##__VA_ARGS__)
> - #define dev_notice(dev, fmt, ...)					\
> - 	_dev_notice(dev, dev_fmt(fmt), ##__VA_ARGS__)
> - #define dev_info(dev, fmt, ...)						\
> - 	_dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
> -=20
> - #if defined(CONFIG_DYNAMIC_DEBUG)
> - #define dev_dbg(dev, fmt, ...)						\
> - 	dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
> - #elif defined(DEBUG)
> - #define dev_dbg(dev, fmt, ...)						\
> - 	dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__)
> - #else
> - #define dev_dbg(dev, fmt, ...)						\
> - ({									\
> - 	if (0)								\
> - 		dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
> - })
> - #endif
> -=20
> - #ifdef CONFIG_PRINTK
> - #define dev_level_once(dev_level, dev, fmt, ...)			\
> - do {									\
> - 	static bool __print_once __read_mostly;				\
> - 									\
> - 	if (!__print_once) {						\
> - 		__print_once =3D true;					\
> - 		dev_level(dev, fmt, ##__VA_ARGS__);			\
> - 	}								\
> - } while (0)
> - #else
> - #define dev_level_once(dev_level, dev, fmt, ...)			\
> - do {									\
> - 	if (0)								\
> - 		dev_level(dev, fmt, ##__VA_ARGS__);			\
> - } while (0)
> - #endif
> -=20
> - #define dev_emerg_once(dev, fmt, ...)					\
> - 	dev_level_once(dev_emerg, dev, fmt, ##__VA_ARGS__)
> - #define dev_alert_once(dev, fmt, ...)					\
> - 	dev_level_once(dev_alert, dev, fmt, ##__VA_ARGS__)
> - #define dev_crit_once(dev, fmt, ...)					\
> - 	dev_level_once(dev_crit, dev, fmt, ##__VA_ARGS__)
> - #define dev_err_once(dev, fmt, ...)					\
> - 	dev_level_once(dev_err, dev, fmt, ##__VA_ARGS__)
> - #define dev_warn_once(dev, fmt, ...)					\
> - 	dev_level_once(dev_warn, dev, fmt, ##__VA_ARGS__)
> - #define dev_notice_once(dev, fmt, ...)					\
> - 	dev_level_once(dev_notice, dev, fmt, ##__VA_ARGS__)
> - #define dev_info_once(dev, fmt, ...)					\
> - 	dev_level_once(dev_info, dev, fmt, ##__VA_ARGS__)
> - #define dev_dbg_once(dev, fmt, ...)					\
> - 	dev_level_once(dev_dbg, dev, fmt, ##__VA_ARGS__)
> -=20
> - #define dev_level_ratelimited(dev_level, dev, fmt, ...)			\
> - do {									\
> - 	static DEFINE_RATELIMIT_STATE(_rs,				\
> - 				      DEFAULT_RATELIMIT_INTERVAL,	\
> - 				      DEFAULT_RATELIMIT_BURST);		\
> - 	if (__ratelimit(&_rs))						\
> - 		dev_level(dev, fmt, ##__VA_ARGS__);			\
> - } while (0)
> -=20
> - #define dev_emerg_ratelimited(dev, fmt, ...)				\
> - 	dev_level_ratelimited(dev_emerg, dev, fmt, ##__VA_ARGS__)
> - #define dev_alert_ratelimited(dev, fmt, ...)				\
> - 	dev_level_ratelimited(dev_alert, dev, fmt, ##__VA_ARGS__)
> - #define dev_crit_ratelimited(dev, fmt, ...)				\
> - 	dev_level_ratelimited(dev_crit, dev, fmt, ##__VA_ARGS__)
> - #define dev_err_ratelimited(dev, fmt, ...)				\
> - 	dev_level_ratelimited(dev_err, dev, fmt, ##__VA_ARGS__)
> - #define dev_warn_ratelimited(dev, fmt, ...)				\
> - 	dev_level_ratelimited(dev_warn, dev, fmt, ##__VA_ARGS__)
> - #define dev_notice_ratelimited(dev, fmt, ...)				\
> - 	dev_level_ratelimited(dev_notice, dev, fmt, ##__VA_ARGS__)
> - #define dev_info_ratelimited(dev, fmt, ...)				\
> - 	dev_level_ratelimited(dev_info, dev, fmt, ##__VA_ARGS__)
> - #if defined(CONFIG_DYNAMIC_DEBUG)
> - /* descriptor check is first to prevent flooding with "callbacks suppre=
ssed" */
> - #define dev_dbg_ratelimited(dev, fmt, ...)				\
> - do {									\
> - 	static DEFINE_RATELIMIT_STATE(_rs,				\
> - 				      DEFAULT_RATELIMIT_INTERVAL,	\
> - 				      DEFAULT_RATELIMIT_BURST);		\
> - 	DEFINE_DYNAMIC_DEBUG_METADATA(descriptor, fmt);			\
> - 	if (DYNAMIC_DEBUG_BRANCH(descriptor) &&				\
> - 	    __ratelimit(&_rs))						\
> - 		__dynamic_dev_dbg(&descriptor, dev, dev_fmt(fmt),	\
> - 				  ##__VA_ARGS__);			\
> - } while (0)
> - #elif defined(DEBUG)
> - #define dev_dbg_ratelimited(dev, fmt, ...)				\
> - do {									\
> - 	static DEFINE_RATELIMIT_STATE(_rs,				\
> - 				      DEFAULT_RATELIMIT_INTERVAL,	\
> - 				      DEFAULT_RATELIMIT_BURST);		\
> - 	if (__ratelimit(&_rs))						\
> - 		dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
> - } while (0)
> - #else
> - #define dev_dbg_ratelimited(dev, fmt, ...)				\
> - do {									\
> - 	if (0)								\
> - 		dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
> - } while (0)
> - #endif
> -=20
> - #ifdef VERBOSE_DEBUG
> - #define dev_vdbg	dev_dbg
> - #else
> - #define dev_vdbg(dev, fmt, ...)						\
> - ({									\
> - 	if (0)								\
> - 		dev_printk(KERN_DEBUG, dev, dev_fmt(fmt), ##__VA_ARGS__); \
> - })
> - #endif
> -=20
> - /*
> -  * dev_WARN*() acts like dev_printk(), but with the key difference of
> -  * using WARN/WARN_ONCE to include file/line information and a backtrac=
e.
> -  */
> - #define dev_WARN(dev, format, arg...) \
> - 	WARN(1, "%s %s: " format, dev_driver_string(dev), dev_name(dev), ## ar=
g);
> -=20
> - #define dev_WARN_ONCE(dev, condition, format, arg...) \
> - 	WARN_ONCE(condition, "%s %s: " format, \
> - 			dev_driver_string(dev), dev_name(dev), ## arg)
> -=20
>   /* Create alias, so I can be autoloaded. */
>   #define MODULE_ALIAS_CHARDEV(major,minor) \
>   	MODULE_ALIAS("char-major-" __stringify(major) "-" __stringify(minor))

Iam still getting the above conflict - just a reminder for pull requests.

--=20
Cheers,
Stephen Rothwell

--Sig_/F8dOWibFgswRmD67=9fgVe_
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl4vTCMACgkQAVBC80lX
0GyKHwf/UmXDp7aIltm0x3+3gLgPdzjcPVcoohFwlGFM73jtCPKTjMYgpswtUFbG
lvUQSBE7TcsHBdVhLZOGE7xPSzQcbeYGEOpWK/ud9jE8Yz5gIPqs58OBJBvddBtC
vBOcfWNTNuIl9sz9zoZp2uZQxCGMhkahhbbzSyBJKXWAhp2lccxviAp0hXiMVoVM
XAfTTjt1kybm7O12as4kYi65+uTHyyfCtvvysWTvcFAoQhhliJa2hh5LJ/Iuypor
RQdwfUn4+pKcZjjrqdGDDC3x6EJPAsfOsSSqEFEfQAoRdpDYISD/uJwjttqXeGTY
MuBoulbdvpj9Z1hiO1hwZa88Xzd0nQ==
=MhPE
-----END PGP SIGNATURE-----

--Sig_/F8dOWibFgswRmD67=9fgVe_--
