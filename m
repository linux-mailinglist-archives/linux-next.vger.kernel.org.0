Return-Path: <linux-next+bounces-4032-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C96D498B31E
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 06:43:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E929283E7B
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 04:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04DD1B9B57;
	Tue,  1 Oct 2024 04:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="Hfa3B3jp"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688BF1B9839;
	Tue,  1 Oct 2024 04:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727757824; cv=none; b=jVbe57cQzJOKbi8PPInuKZ5XJXwvjxKbK3dlhK/NrieSKO5Ol72sB3rZIoKaXoTSbn2XRRhujUdcPT00vnmaxIGlinkbr2oJdODpEdpaFdA3pb/dk35d+SjahkAQGKAbmx6mofsbv8dMg1fSmvie/aSaGp3m8O8sLH5C7Y68pfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727757824; c=relaxed/simple;
	bh=WLk3ozzZ7fct++49tRQXWnj159M0fCI/CGVJRImKcFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=dMXJM6hZFQbI7vQekZS5JsM5hQKuYelKrG08nFqrNnmSwQcqE77KUaRX7Ilrtly1AlbQwBr9dFAPve6e3M0FCzTWuG4L1W456LO4lkZdtpIs/R8qHuiIHcVvhLjIysg8RZbLlaZharn98/bnXw8OaB/a8813BO3irI22LMStKl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=Hfa3B3jp; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1727757814;
	bh=IqICxuF/eRAsDGZ26CoGE4lfZdNGMVXZrBFZavi7tPk=;
	h=Date:From:To:Cc:Subject:From;
	b=Hfa3B3jp37u+0DFhP/stKOloVwxun36W6m6Oz7tu9b3Gpqz+hQ58D2MF+CLkYFUuM
	 wMJVBWa75AFYIZljelUAOdPlVOSIMutjfRx0iC+bXcZVbxB1J2nm9eJZPHMxoMRAZT
	 pMZt2j2S0ebPpFbilz0G7s6238IGeYZ3b2V2oSAwqedhIS3XKwvEFHVH2AwgwbiWFq
	 OXM+xeuPXKv2ijTtUHmdKmgP8RBHie2pusliwS5k+l0wjZBMzhHTaDOPZ07UbavBse
	 jXt6dLdSTAwkk+AfeGEBVmq/4t/5a8MLWIp/MLI3Wk7auyzm1+Kx3C6FIZwcGqibJX
	 z8DUoj+ZQZZzQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XHlgp1YK7z4x04;
	Tue,  1 Oct 2024 14:43:34 +1000 (AEST)
Date: Tue, 1 Oct 2024 14:43:34 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 1
Message-ID: <20241001144334.52a7cf3d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/DcVuFfPCk5voHt.rHuJWWiE";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/DcVuFfPCk5voHt.rHuJWWiE
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Changes since 20240930:

My build of Linus' tree still failed for which I applied a supplied patch.

Linus' tree lost one of its build failures.

The vfs-brauner tree gained a conflict against the rust-fixes tree and
a build failure for which I applied a patch.

The drm-xe tree gained a semantic conflict against the drm-intel tree.

The random tree gained a semantic conflict against the drm-xe tree.

Non-merge commits (relative to Linus' tree): 939
 1162 files changed, 28593 insertions(+), 17769 deletions(-)

----------------------------------------------------------------------------

I have created today's linux-next tree at
git://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
(patches at http://www.kernel.org/pub/linux/kernel/next/ ).  If you
are tracking the linux-next tree using git, you should not use "git pull"
to do so as that will try to merge the new linux-next release with the
old one.  You should use "git fetch" and checkout or reset to the new
master.

You can see which trees have been included by looking in the Next/Trees
file in the source.  There is also the merge.log file in the Next
directory.  Between each merge, the tree was built with a ppc64_defconfig
for powerpc, an allmodconfig for x86_64, a multi_v7_defconfig for arm
and a native build of tools/perf. After the final fixups (if any), I do
an x86_64 modules_install followed by builds for x86_64 allnoconfig,
powerpc allnoconfig (32 and 64 bit), ppc44x_defconfig, allyesconfig
and pseries_le_defconfig and i386, arm64, s390, sparc and sparc64
defconfig and htmldocs. And finally, a simple boot test of the powerpc
pseries_le_defconfig kernel in qemu (with and without kvm enabled).

Below is a summary of the state of the merge.

I am currently merging 375 trees (counting Linus' and 140 trees of bug
fix patches pending for the current merge release).

Stats about the size of the tree over time can be seen at
http://neuling.org/linux-next-size.html .

Status of my local build tests will be at
http://kisskb.ellerman.id.au/linux-next .  If maintainers want to give
advice about cross compilers/configs that work, we are always open to add
more builds.

Thanks to Randy Dunlap for doing many randconfig builds.  And to Paul
Gortmaker for triage and bug fixes.

--=20
Cheers,
Stephen Rothwell

$ git checkout master
$ git reset --hard stable
Merging origin/master (e32cde8d2bd7 Merge tag 'sched_ext-for-6.12-rc1-fixes=
-1' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext)
Merging fixes/fixes (c216e09d8505 rust: cfi: fix `patchable-function-entry`=
 starting version)
Merging vfs-brauner-fixes/vfs.fixes (f801850bc263 netfs: Fix the netfs_foli=
o tracepoint to handle NULL mapping)
Merging fscrypt-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging fsverity-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging btrfs-fixes/next-fixes (a064948e242c Merge branch 'misc-6.12' into =
next-fixes)
Merging vfs-fixes/fixes (678379e1d4f7 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (98dd36c9fa08 erofs: ensure regular inodes for fi=
le-backed mounts)
Merging nfsd-fixes/nfsd-fixes (53e4e1755704 nfsd: nfsd_destroy_serv() must =
call svc_destroy() even if nfsd_startup_net() failed)
Merging v9fs-fixes/fixes/next (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of g=
it://git.linux-nfs.org/projects/anna/linux-nfs)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (87a3e08121cb bcachefs: Switch to memalloc_flags_=
do() for vmalloc allocations)
Merging fscrypt/for-next (256abd8e550c Linux 6.10-rc7)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (e7c10ac01f31 Merge branch 'for-next-next-v6.12-2024=
0916' into for-next-20240916)
Merging ceph/master (65e9f8429166 ceph: use struct_size() helper in __ceph_=
pool_perm_get())
Merging cifs/for-next (bf8a36505e0f smb: client: stop flooding dmesg with a=
utomounts)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (652b0ae675fe dlm: add missing -ENOMEM if alloc_workqueue(=
) fails)
Merging erofs/dev (9852d85ec9d4 Linux 6.12-rc1)
Merging exfat/dev (cb7d85014fb1 MAINTAINERS: exfat: add myself as reviewer)
Merging exportfs/exportfs-next (98f7e32f20d2 Linux 6.11)
Merging ext3/for_next (802e492f2fda Merge fanotify HSM events implementatio=
n.)
CONFLICT (content): Merge conflict in fs/bcachefs/fs.c
CONFLICT (content): Merge conflict in mm/filemap.c
Merging ext4/dev (ff2beee206d2 ext4: convert EXT4_B2C(sbi->s_stripe) users =
to EXT4_NUM_B2C)
Merging f2fs/dev (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of git://git.linu=
x-nfs.org/projects/anna/linux-nfs)
Merging fsverity/for-next (256abd8e550c Linux 6.10-rc7)
Merging fuse/for-next (60fe2d7fa5c9 fuse: enable dynamic configuration of f=
use max pages limit (FUSE_MAX_MAX_PAGES))
Merging gfs2/for-next (7c6f714d8847 gfs2: Fix unlinked inode cleanup)
Merging jfs/jfs-next (2b59ffad47db jfs: Fix uninit-value access of new_ea i=
n ea_buffer)
Merging ksmbd/ksmbd-for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging nfs/linux-next (67784a74e258 Merge tag 'ata-6.11-rc7' of git://git.=
kernel.org/pub/scm/linux/kernel/git/libata/linux)
Merging nfs-anna/linux-next (68898131d2df nfs: Fix `make htmldocs` warnings=
 in the localio documentation)
Merging nfsd/nfsd-next (dc947efe6ee6 NFSD: Remove unnecessary posix_acl_ent=
ry pointer initialization)
Merging ntfs3/master (689ecd06ef8d fs/ntfs3: Rename ntfs3_setattr into ntfs=
_setattr)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (6c4a5f964504 ovl: fail if trusted xattrs =
are needed but caller lacks permission)
Merging ubifs/next (92a286e90203 ubi: Fix ubi_init() ubiblock_exit() sectio=
n mismatch)
Merging v9fs/9p-next (79efebae4afc 9p: Avoid creating multiple slab caches =
with the same name)
Merging v9fs-ericvh/ericvh/for-next (684a64bf32b6 Merge tag 'nfs-for-6.12-1=
' of git://git.linux-nfs.org/projects/anna/linux-nfs)
Merging xfs/for-next (90fa22da6d6b xfs: ensure st_blocks never goes to zero=
 during COW writes)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (26051352211f Merge branch 'vfs.mount.api' into=
 vfs.all Signed-off-by: Christian Brauner <brauner@kernel.org>)
CONFLICT (content): Merge conflict in fs/btrfs/super.c
CONFLICT (content): Merge conflict in fs/ext4/super.c
CONFLICT (content): Merge conflict in fs/xfs/xfs_super.c
CONFLICT (content): Merge conflict in include/linux/fs.h
Merging vfs/for-next (de12c3391bce add struct fd constructors, get rid of _=
_to_fd())
Merging mm-hotfixes/mm-hotfixes-unstable (006032ce24b7 mseal: update mseal.=
rst)
Merging fs-current (686c59809995 Merge branch 'nfsd-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/fixes (4d46b5b623e0 kconfig: fix infinite loop in sy=
m_calc_choice())
Merging arc-current/for-curr (e67572cd2204 Linux 6.9-rc6)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (c060f93253ca arm64: stacktrace: fix the=
 usage of ftrace_graph_ret_addr())
Merging arm-soc-fixes/arm/fixes (0e7af99aef5f Merge tag 'riscv-soc-fixes-fo=
r-v6.11-final' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/lin=
ux into arm/fixes)
Merging davinci-current/davinci/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging sophgo-fixes/fixes (8400291e289e Linux 6.11-rc1)
Merging m68k-current/for-linus (b90fae5df917 m68k: defconfig: Update defcon=
figs for v6.11-rc1)
Merging powerpc-fixes/fixes (4b058c9f281f powerpc/vdso: allow r30 in vDSO c=
ode generation of getrandom)
Merging s390-fixes/fixes (98f7e32f20d2 Linux 6.11)
Merging net/main (d505d3593b52 net: wwan: qcom_bam_dmux: Fix missing pm_run=
time_disable())
Merging bpf/master (99a648c951ba selftests/bpf: Verify that sync_linked_reg=
s preserves subreg_def)
Merging ipsec/master (645546a05b03 xfrm: policy: remove last remnants of pe=
rnet inexact list)
Merging netfilter/main (10dbd23633f0 selftests: netfilter: Add missing retu=
rn value)
Merging ipvs/main (10dbd23633f0 selftests: netfilter: Add missing return va=
lue)
Merging wireless/for-next (d4cdc46ca16a wifi: iwlegacy: Fix "field-spanning=
 write" warning in il_enqueue_hcmd())
Merging ath/for-current (2f833e8948d6 Revert "wifi: ath11k: support hiberna=
tion")
Merging wpan/master (09573b1cc76e net: ieee802154: mcr20a: Use IRQF_NO_AUTO=
EN flag in request_irq())
Merging rdma-fixes/for-rc (8400291e289e Linux 6.11-rc1)
Merging sound-current/for-linus (368e4663c557 ALSA: mixer_oss: Remove some =
incorrect kfree_const() usages)
Merging sound-asoc-fixes/for-linus (a36614bf88cd ASoC: dt-bindings: renesas=
,rsnd: correct reg-names for R-Car Gen1)
Merging regmap-fixes/for-linus (e2fb1465f182 Merge remote-tracking branch '=
regmap/for-6.11' into regmap-linus)
Merging regulator-fixes/for-linus (fdeb154f578e Merge remote-tracking branc=
h 'regulator/for-6.11' into regulator-linus)
Merging spi-fixes/for-linus (9852d85ec9d4 Linux 6.12-rc1)
Merging pci-current/for-linus (9852d85ec9d4 Linux 6.12-rc1)
Merging driver-core.current/driver-core-linus (ad46e8f95e93 Merge tag 'pm-6=
.12-rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging tty.current/tty-linus (9852d85ec9d4 Linux 6.12-rc1)
Merging usb.current/usb-linus (9852d85ec9d4 Linux 6.12-rc1)
Merging usb-serial-fixes/usb-linus (7d47d22444bb USB: serial: pl2303: add d=
evice id for Macrosilicon MS3020)
Merging phy/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging staging.current/staging-linus (075dbe9f6e3c Merge tag 'soc-ep93xx-d=
t-6.12' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc)
Merging iio-fixes/fixes-togreg (d6bf6983b394 iio: pressure: sdp500: Add mis=
sing select CRC8)
Merging counter-current/counter-current (9852d85ec9d4 Linux 6.12-rc1)
Merging char-misc.current/char-misc-linus (ad46e8f95e93 Merge tag 'pm-6.12-=
rc1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging soundwire-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging thunderbolt-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging input-current/for-linus (358800b70250 ARM: spitz: fix compile error=
 when matrix keypad driver is enabled)
Merging crypto-current/master (44ac4625ea00 crypto: powerpc/p10-aes-gcm - D=
isable CRYPTO_AES_GCM_P10)
Merging vfio-fixes/for-linus (5a88a3f67e37 vfio/pci: Init the count variabl=
e in collecting hot-reset devices)
Merging kselftest-fixes/fixes (45a8897db67d selftests: exec: update gitigno=
re for load_address)
Merging dmaengine-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (bd92c1e07beb mtd: hyperbus: rpc-if: Add missin=
g MODULE_DEVICE_TABLE)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (63de936b513f media: atomisp: Fix streaming no =
longer working on BYT / ISP2400 devices)
Merging reset-fixes/reset/fixes (2cf596636607 reset: starfive: jh71x0: Fix =
accessing the empty member on JH7110 SoC)
Merging mips-fixes/mips-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging at91-fixes/at91-fixes (e9408fa234fb MAINTAINERS: Update DTS path fo=
r ARM/Microchip (AT91) SoC)
Merging omap-fixes/fixes (5062d9c0cbbc ARM: dts: omap3-n900: correct the ac=
celerometer orientation)
Merging kvm-fixes/master (59cbd4eea48f KVM: Remove HIGH_RES_TIMERS dependen=
cy)
Merging kvms390-fixes/master (cff59d8631e1 s390/uv: Panic for set and remov=
e shared access UVC errors)
Merging hwmon-fixes/hwmon (f5002abdef34 hwmon: (adt7475) Fix memory leak in=
 adt7475_fan_pwm_config())
Merging nvdimm-fixes/libnvdimm-fixes (d5240fa65db0 nvdimm/pmem: Set dax fla=
g for all 'PFN_MAP' cases)
Merging cxl-fixes/fixes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping-fixes/for-linus (75961ffb5cb3 swiotlb: initialise restr=
icted pool list_head when SWIOTLB_DYNAMIC=3Dy)
Merging drivers-x86-fixes/fixes (d6de45e3c6f3 platform/x86: asus-wmi: Disab=
le OOBE experience on Zenbook S 16)
Merging samsung-krzk-fixes/fixes (a03c246d4ec8 clk: samsung: Fix out-of-bou=
nd access of of_match_node())
Merging pinctrl-samsung-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging devicetree-fixes/dt/linus (b739dffa5d57 of/irq: Prevent device addr=
ess out-of-bounds read in interrupt map walk)
Merging dt-krzk-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging scsi-fixes/fixes (0f9592ae26ff scsi: ufs: ufs-mediatek: Add UFSHCD_=
QUIRK_BROKEN_LSDBS_CAP)
Merging drm-fixes/drm-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging drm-intel-fixes/for-linux-next-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging mmc-fixes/fixes (aea62c744a9a mmc: cqhci: Fix checking of CQHCI_HAL=
T state)
Merging rtc-fixes/rtc-fixes (8400291e289e Linux 6.11-rc1)
Merging gnss-fixes/gnss-linus (8400291e289e Linux 6.11-rc1)
Merging hyperv-fixes/hyperv-fixes (895384881ec9 hv: vmbus: Constify struct =
kobj_type and struct attribute_group)
Merging risc-v-fixes/fixes (7c1e5b9690b0 riscv: Disable preemption while ha=
ndling PR_RISCV_CTX_SW_FENCEI_OFF)
Merging riscv-dt-fixes/riscv-dt-fixes (7d9d88890f04 MAINTAINERS: invert Mis=
c RISC-V SoC Support's pattern)
Merging riscv-soc-fixes/riscv-soc-fixes (61f2e8a3a941 riscv: dts: starfive:=
 jh7110-common: Fix lower rate of CPUfreq by setting PLL0 rate to 1.5GHz)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (47ac09b91bef Linux 6.11-rc4)
Merging gpio-brgl-fixes/gpio/for-current (3360d41f4ac4 gpio: davinci: fix l=
azy disable)
Merging gpio-intel-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pinctrl-intel-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging auxdisplay-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-fixes/kunit-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging memblock-fixes/fixes (8043832e2a12 memblock: use numa_valid_node() =
helper to check for invalid node ID)
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (de5cb0dcb74c Merge branch 'address-masking=
')
Merging efi-fixes/urgent (ae835a96d72c x86/efistub: Revert to heap allocate=
d boot_params for PE entrypoint)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (7c626ce4bae1 Linux 6.11-rc3)
Merging iommufd-fixes/for-rc (cf1e515c9a40 iommufd/selftest: Make dirty_ops=
 static)
Merging rust-fixes/rust-fixes (4c66f8307ac0 cfi: encode cfi normalized inte=
gers + kasan/gcov bug in Kconfig)
Merging w1-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pmdomain-fixes/fixes (9ec87c5957ea OPP: Fix support for required OP=
Ps for multiple PM domains)
Merging i2c-host-fixes/i2c/i2c-host-fixes (0c8d604dea43 i2c: xiic: Fix pm_r=
untime_set_suspended() with runtime pm enabled)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (a4d89b11aca3 clk: qcom: clk-alpha-pll: Simplif=
y the zonda_pll_adjust_l_val())
Merging pwrseq-fixes/pwrseq/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging thead-dt-fixes/thead-dt-fixes (8400291e289e Linux 6.11-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (abf201f6ce14 drm/sched: revert=
 "Always increment correct scheduler score")
Merging mm-stable/mm-stable (9852d85ec9d4 Linux 6.12-rc1)
Merging mm-nonmm-stable/mm-nonmm-stable (9852d85ec9d4 Linux 6.12-rc1)
Merging mm/mm-everything (ca0000653cab foo)
  4a01c512208d ("device-dax: correct pgoff align in dax_set_mapping()")
  69ff559c6da2 ("selftests/mm: fix incorrect buffer->mirror size in hmm2 do=
uble_map test")
  88ddf641ced2 ("mseal: update mseal.rst")
  8a09bd14c0de ("Revert "mm: introduce PF_MEMALLOC_NORECLAIM, PF_MEMALLOC_N=
OWARN"")
  8f237aa30997 ("bcachefs-do-not-use-pf_memalloc_noreclaim-fix")
  a3814c95320d ("kthread: Unpark only parked kthread")
  a4cdb1a19d52 ("bcachefs: do not use PF_MEMALLOC_NORECLAIM")
  d8e2dd43582b ("mm: avoid unconditional one-tick sleep when swapcache_prep=
are fails")
Merging kbuild/for-next (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of git://g=
it.linux-nfs.org/projects/anna/linux-nfs)
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (b38c49d8296b perf/test: Speed up test case pe=
rf annotate basic tests)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (bfc4a245a794 dma-mapping: fix DMA API tracing=
 for chained scatterlists)
Merging asm-generic/master (b82c1d235a30 syscalls: add back legacy __NR_nfs=
servctl macro)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (9016915e3c5f Merge branches 'amba', 'fixes' and 'misc=
' into for-next)
Merging arm64/for-next/core (75078ba2b38a Merge branch 'for-next/timers' in=
to for-next/core)
Merging arm-perf/for-next/perf (7c626ce4bae1 Linux 6.11-rc3)
Merging arm-soc/for-next (7c590fea8c11 soc: document merges)
Merging amlogic/for-next (c0f04972d35b Merge branch 'v6.13/arm-dt' into for=
-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (b4c322c2783a ARM: dts: aspeed: catalina: Update io=
 expander line names)
Merging at91/at91-next (ee735afc2dae Merge branch 'at91-soc' into at91-next)
Merging broadcom/next (dd6a4d9790d0 Merge branch 'soc/next' into next)
Merging davinci/davinci/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory/for-next (89e6684538f5 dt-bindings: memory-controlle=
rs: fsl,ifc: split child node differences)
Merging imx-mxs/for-next (79e1b8171ca4 Merge branch 'imx/defconfig' into fo=
r-next)
Merging mediatek/for-next (4f4b3263feee Merge branch 'v6.11-next/soc' into =
for-next)
Merging mvebu/for-next (dea56c781ed3 ARM: dove: Drop a write-only variable)
Merging omap/for-next (ba1b153f6d27 Merge branch 'omap-for-v6.12/drivers' i=
nto tmp/omap-next-20240904.164705)
Merging qcom/for-next (2adcf3941db7 Merge branches 'arm32-for-6.12', 'arm64=
-defconfig-fixes-for-6.11', 'arm64-defconfig-for-6.12', 'arm64-fixes-for-6.=
11', 'arm64-for-6.12', 'clk-fixes-for-6.11', 'clk-for-6.12', 'drivers-fixes=
-for-6.11' and 'drivers-for-6.12' into for-next)
Merging renesas/next (9852d85ec9d4 Linux 6.12-rc1)
Merging reset/reset/next (5b93105afcdc reset: amlogic: add auxiliary reset =
driver support)
Merging rockchip/for-next (a54b791f412f Merge branch 'v6.13-armsoc/dts64' i=
nto for-next)
Merging samsung-krzk/for-next (fc520ea5881b Merge branches 'next/clk' and '=
next/soc' into for-next)
Merging scmi/for-linux-next (646a799a3f96 Merge branches 'for-next/ffa/fixe=
s' and 'for-next/scmi/updates' of ssh://gitolite.kernel.org/pub/scm/linux/k=
ernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (4ea8511c034b riscv: dts: sophgo: cv1812h: add pinc=
trl support)
Merging stm32/stm32-next (b14c9f6bd0ba ARM: dts: stm32: Use SAI to generate=
 bit and frame clock on STM32MP15xx DHCOM PDK2)
Merging sunxi/sunxi/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging tee/next (cd88a296582c Merge branch 'optee_notif_wait_timeout_for_v=
6.11' into next)
Merging tegra/for-next (6726d2c6a157 Merge branch for-6.12/arm64/defconfig =
into for-next)
Merging thead-dt/thead-dt-for-next (2d98fea7491a riscv: dts: thead: change =
TH1520 SPI node to use clock controller)
Merging ti/ti-next (9852d85ec9d4 Linux 6.12-rc1)
Merging xilinx/for-next (31dba0dd2fa7 Merge branch 'zynqmp/soc' into for-ne=
xt)
Merging clk/clk-next (f00b45db02ae clk: Switch back to struct platform_driv=
er::remove())
Merging clk-imx/for-next (32c055ef563c clk: imx6ul: fix clock parent for IM=
X6UL_CLK_ENETx_REF_SEL)
Merging clk-renesas/renesas-clk (3aeccbe08171 clk: renesas: r9a09g057: Add =
clock and reset entries for GTM/RIIC/SDHI/WDT)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (f339bd3b51da Docs/LoongArch: Add advanced=
 extended IRQ model description)
Merging m68k/for-next (b90fae5df917 m68k: defconfig: Update defconfigs for =
v6.11-rc1)
Merging m68knommu/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging microblaze/next (d829e7ee6354 microblaze: Export xmb_manager functi=
ons)
Merging mips/mips-next (9852d85ec9d4 Linux 6.12-rc1)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (98f7e32f20d2 Linux 6.11)
Merging powerpc/next (9852d85ec9d4 Linux 6.12-rc1)
Merging risc-v/for-next (b3f835cd7339 crash: Fix riscv64 crash memory reser=
ve dead loop)
Merging riscv-dt/riscv-dt-for-next (8400291e289e Linux 6.11-rc1)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (2d8721364ce8 s390/vfio-ap: Driver feature advertisem=
ent)
Merging sh/for-next (c3e878ca7b66 sh: intc: Replace simple_strtoul() with k=
strtoul())
Merging sparc/for-next (d21dffe51baa arch/sparc: remove unused varible padd=
rbase in function leon_swprobe())
Merging uml/next (381d2f95c8aa um: fix time-travel syscall scheduling hack)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging fs-next (4092cace9830 Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
CONFLICT (content): Merge conflict in rust/kernel/lib.rs
Applying: Reapply "mm: introduce PF_MEMALLOC_NORECLAIM, PF_MEMALLOC_NOWARN"
Merging printk/for-next (b794563ea12f Merge branch 'for-6.11-fixup' into fo=
r-next)
Merging pci/next (9852d85ec9d4 Linux 6.12-rc1)
Merging pstore/for-next/pstore (1bf8012fc699 pstore: replace spinlock_t by =
raw_spinlock_t)
Merging hid/for-next (442be0efc821 Merge branch 'for-6.12/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging i2c-host/i2c/i2c-host (383d1324f9f0 i2c: designware: Fix spelling a=
nd other issues in the comments)
Merging i3c/i3c/next (618507257797 i3c: master: svc: Fix use after free vul=
nerability in svc_i3c_master Driver Due to Race Condition)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (de61d0898fa1 hwmon: (amc6821) add support=
 for tsd,mule)
Merging jc_docs/docs-next (052f172ef127 Merge branch 'docs-mw' into docs-ne=
xt)
Merging v4l-dvb/master (3f52e32445a1 media: MAINTAINERS: Add "qcom," substr=
ing for Qualcomm Camera Subsystem)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (9852d85ec9d4 Linux 6.12-rc1)
Merging cpufreq-arm/cpufreq/arm/linux-next (6b612d1bac67 cpufreq: ti-cpufre=
q: Use socinfo to get revision in AM62 family)
Merging cpupower/cpupower (08a26a15a4cd pm: cpupower: gitignore: Add compil=
e_commands.json)
Merging devfreq/devfreq-next (d47552124bb0 PM / devfreq: imx-bus: Use of_pr=
operty_present())
Merging pmdomain/next (c6ccb691d484 pmdomain: core: Reduce debug summary ta=
ble width)
Merging opp/opp/linux-next (a84372012e93 dt-bindings: opp: operating-points=
-v2-ti-cpu: Update maintainers)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (709209419233 RDMA/bnxt_re: Remove the unused variabl=
e en_dev)
Merging net-next/main (c824deb1a897 cxgb4: clip_tbl: Fix spelling mistake "=
wont" -> "won't")
Merging bpf-next/for-next (db5ca265e333 libbpf: Change log level of BTF loa=
ding error message)
Merging ipsec-next/master (e62d39332d4b xfrm: policy: Restore dir assignmen=
ts in xfrm_hash_rebuild())
Merging mlx5-next/mlx5-next (c772a2c69018 net/mlx5: Add IFC related stuff f=
or data direct)
Merging netfilter-next/main (9410645520e9 Merge tag 'net-next-6.12' of git:=
//git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging ipvs-next/main (9410645520e9 Merge tag 'net-next-6.12' of git://git=
.kernel.org/pub/scm/linux/kernel/git/netdev/net-next)
Merging bluetooth/master (cc34f7a69916 Bluetooth: btnxpuart: Rename IW615 t=
o IW610)
Merging wireless-next/for-next (5a4d42c1688c wifi: wl1251: Use IRQF_NO_AUTO=
EN flag in request_irq())
Merging ath-next/for-next (1a0c640ce1cd wifi: ath12k: Skip Rx TID cleanup f=
or self peer)
Merging wpan-next/master (ac49b950bea9 dt-bindings: net: add Microchip's LA=
N865X 10BASE-T1S MACPHY)
Merging wpan-staging/staging (ac49b950bea9 dt-bindings: net: add Microchip'=
s LAN865X 10BASE-T1S MACPHY)
Merging mtd/mtd/next (869acb874f2b Merge tag 'nand/for-6.12' into mtd/next)
Merging nand/nand/next (475aadeba5df mtd: spinand: macronix: Flag parts nee=
ding explicit plane select)
Merging spi-nor/spi-nor/next (ac5bfa968b60 mtd: spi-nor: fix flash probing)
Merging crypto/master (ce212d2afca4 crypto: n2 - Set err to EINVAL if snpri=
ntf fails for hmac)
Merging drm/drm-next (9852d85ec9d4 Linux 6.12-rc1)
Merging drm-exynos/for-linux-next (94ebc3d3235c drivers:drm:exynos_drm_gsc:=
Fix wrong assignment in gsc_bind())
Merging drm-misc/for-linux-next (ba2b9de0c1ac drm/tegra: fix potential unin=
itialized variable use)
Merging amdgpu/drm-next (d7d2688bf4ea drm/amd/pm: update workload mask afte=
r the setting)
Merging drm-intel/for-linux-next (680d12cdb7e6 Revert "drm/i915/psr: Implem=
ent WA to help reach PC10")
Merging drm-msm/msm-next (15302579373e drm/msm/dpu: enable writeback on SM6=
350)
Merging drm-msm-lumag/msm-next-lumag (15302579373e drm/msm/dpu: enable writ=
eback on SM6350)
Merging drm-xe/drm-xe-next (0c8650b09a36 drm/xe/oa: Don't reset OAC_CONTEXT=
_ENABLE on OA stream close)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_oa.c
Applying: fix up for "lib/string_choices: Add str_up_down() helper"
Applying: fix up for "drm/xe: Wire up device shutdown handler"
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (98f7e32f20d2 Linux 6.11)
Merging regmap/for-next (14cb88ad5b3e Merge branch 'regmap-linus' into regm=
ap-next)
Merging sound/for-next (368e4663c557 ALSA: mixer_oss: Remove some incorrect=
 kfree_const() usages)
Merging ieee1394/for-next (f1cba5212e25 firewire: core: rename cause flag o=
f tracepoints event)
Merging sound-asoc/for-next (9938216c99e2 Merge remote-tracking branch 'aso=
c/for-6.13' into asoc-next)
Merging modules/modules-next (b319cea80539 module: Refine kmemleak scanned =
areas)
Merging input/next (c7bf046925dc Input: novatek-nvt-ts - add support for NT=
36672A touchscreen)
Merging block/for-next (52d980df51c6 Merge branch 'for-6.13/io_uring' into =
for-next)
Merging device-mapper/for-next (579b2ba40ece dm verity: fallback to platfor=
m keyring also if key in trusted keyring is rejected)
Merging libata/for-next (0e9a2990a93f ata: libata-scsi: Fix ata_msense_cont=
rol() CDL page reporting)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (cd3689b6772f mmc: core: Use dev_err_probe for deferred re=
gulators)
Merging mfd/for-mfd-next (91dba615c343 mfd: atc260x: Convert a bunch of com=
mas to semicolons)
Merging backlight/for-backlight-next (fea88a13a5d1 backlight: l4f00242t03: =
Add check for spi_setup)
Merging battery/for-next (e50a57d16f89 power: supply: hwmon: Fix missing te=
mp1_max_alarm attribute)
Merging regulator/for-next (c74e58fd25e1 Merge remote-tracking branch 'regu=
lator/for-6.13' into regulator-next)
Merging security/next (f89722faa314 ipe: Add missing terminator to list of =
unit tests)
Merging apparmor/apparmor-next (8400291e289e Linux 6.11-rc1)
Merging integrity/next-integrity (fa8a4ce432e8 ima: fix buffer overrun in i=
ma_eventdigest_init_common)
Merging selinux/next (83f8b733c9b7 Automated merge of 'dev' into 'next')
Merging smack/next (2749749afa07 smackfs: Use rcu_assign_pointer() to ensur=
e safe assignment in smk_set_cipso)
Merging tomoyo/master (ada1986d0797 tomoyo: fallback to realpath if symlink=
's pathname does not exist)
Merging tpmdd/next (558bdc45dfb2 sign-file,extract-cert: use pkcs11 provide=
r for OPENSSL MAJOR >=3D 3)
Merging watchdog/master (9852d85ec9d4 Linux 6.12-rc1)
Merging iommu/next (97162f6093d2 Merge branches 'fixes', 'arm/smmu', 'intel=
/vt-d', 'amd/amd-vi' and 'core' into next)
Merging audit/next (8c1867a2f0fd audit: Make use of str_enabled_disabled() =
helper)
Merging devicetree/for-next (0c36680c0e2d dt-bindings: watchdog: Add rockch=
ip,rk3576-wdt compatible)
Merging dt-krzk/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging mailbox/for-next (54595f2807d2 mailbox, remoteproc: omap2+: fix com=
pile testing)
Merging spi/for-next (356749a2b22b Improve error handling in Rockchip SPI d=
rivers)
Merging tip/master (5b0c5f05fb2f Merge branch into tip/master: 'x86/splitlo=
ck')
Merging clockevents/timers/drivers/next (d7a87891e2f5 platform/x86:intel/pm=
c: fix build regression with pmtimer turned off)
Merging edac/edac-for-next (61124f42dcaa Merge ras/edac-drivers into for-ne=
xt)
Merging ftrace/for-next (886f3732878d Merge ring-buffer/for-next)
Merging rcu/next (355debb83bf7 Merge branches 'context_tracking.15.08.24a',=
 'csd.lock.15.08.24a', 'nocb.09.09.24a', 'rcutorture.14.08.24a', 'rcustall.=
09.09.24a', 'srcu.12.08.24a', 'rcu.tasks.14.08.24a', 'rcu_scaling_tests.15.=
08.24a', 'fixes.12.08.24a' and 'misc.11.08.24a' into next.09.09.24a)
Merging paulmck/non-rcu/next (3b27dde7b75d Merge branches 'cmpxchg.2024.09.=
13a', 'lkmm.2024.09.14a', 'kcsan.2024.08.01a' and 'misc.2024.08.02a' into H=
EAD)
Merging kvm/next (efbc6bd090f4 Documentation: KVM: fix warning in "make htm=
ldocs")
Merging kvm-arm/next (17a000564499 Merge branch kvm-arm64/visibility-cleanu=
ps into kvmarm-master/next)
Merging kvms390/next (f9b56b2c31e5 s390: Enable KVM_S390_UCONTROL config in=
 debug_defconfig)
Merging kvm-ppc/topic/ppc-kvm (9852d85ec9d4 Linux 6.12-rc1)
Merging kvm-riscv/riscv_kvm_next (5aa09297a3dc RISC-V: KVM: Fix to allow hp=
mcounter31 from the guest)
Merging kvm-x86/next (3cc25d5adcfd Merge branches 'fixes', 'generic', 'misc=
', 'mmu', 'pat_vmx_msrs', 'selftests', 'svm' and 'vmx')
Merging xen-tip/linux-next (47ffe0578aee x86/pvh: Add 64bit relocation page=
 tables)
Merging percpu/for-next (79125d57644c Merge branch 'for-6.12' into for-next)
Merging workqueues/for-next (90c6d73ac19d Merge branch 'for-6.11-fixes' int=
o for-next)
Merging sched-ext/for-next (161853a78bb2 sched/ext: Use tg_cgroup() to elie=
minate duplicate code)
Merging drivers-x86/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging chrome-platform/for-next (7cbf28998d73 platform/chrome: Drop explic=
it initialization of struct i2c_device_id::driver_data to 0)
Merging chrome-platform-firmware/for-firmware-next (67f488dff17e firmware: =
coreboot: Don't register a pdev if screen_info data is present)
Merging hsi/for-next (c3eddf5e8c30 HSI: omap-ssi: Remove unnecessary debugf=
s_create_dir() error check)
Merging leds-lj/for-leds-next (64c38866500b leds: turris-omnia: Fix module =
autoloading with MODULE_DEVICE_TABLE())
Merging ipmi/for-next (11a299a7933e Merge tag 'for-6.12/block-20240925' of =
git://git.kernel.dk/linux)
Merging driver-core/driver-core-next (ad46e8f95e93 Merge tag 'pm-6.12-rc1-2=
' of git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging usb/usb-next (9852d85ec9d4 Linux 6.12-rc1)
Merging thunderbolt/next (9852d85ec9d4 Linux 6.12-rc1)
Merging usb-serial/usb-next (4c0d9477ba69 USB: serial: kobil_sct: restore i=
nitial terminal settings)
Merging tty/tty-next (9852d85ec9d4 Linux 6.12-rc1)
Merging char-misc/char-misc-next (ad46e8f95e93 Merge tag 'pm-6.12-rc1-2' of=
 git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (988d40a4d4e7 coresight: Make trace ID map spinlock =
local to the map)
Merging fastrpc/for-next (8400291e289e Linux 6.11-rc1)
Merging fpga/for-next (8de36789bd03 fpga: zynq-fpga: Rename 'timeout' varia=
ble as 'time_left')
Merging icc/icc-next (a5733950fe35 Merge branch 'icc-sm8350' into icc-next)
Merging iio/togreg (fec496684388 iio: adc: ad7173: add support for ad4113)
Merging phy-next/next (9852d85ec9d4 Linux 6.12-rc1)
Merging soundwire/next (9852d85ec9d4 Linux 6.12-rc1)
Merging extcon/extcon-next (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss/gnss-next (8400291e289e Linux 6.11-rc1)
Merging vfio/next (aab439ffa1ca vfio/pci: clean up a type in vfio_pci_ioctl=
_pci_hot_reset_groups())
Merging w1/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging spmi/spmi-next (7c626ce4bae1 Linux 6.11-rc3)
Merging staging/staging-next (075dbe9f6e3c Merge tag 'soc-ep93xx-dt-6.12' o=
f git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc)
Merging counter-next/counter-next (a3911e087d62 counter: ftm-quaddec: Enabl=
e module autoloading)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (5be63fc19fca Linux 6.11-rc5)
Merging dmaengine/next (9852d85ec9d4 Linux 6.12-rc1)
Merging cgroup/for-next (95a616d89ccd cgroup/cpuset: Fix spelling errors in=
 file kernel/cgroup/cpuset.c)
Merging scsi/for-next (5fe9a493006d Merge branch 'misc' into for-next)
Merging scsi-mkp/for-next (359aeb86480d Merge patch series "Update lpfc to =
revision 14.4.0.5")
Merging vhost/linux-next (b9efbe2b8f01 virtio_console: fix misc probe bugs)
Merging rpmsg/for-next (8a8622b7c206 remoteproc: Use iommu_paging_domain_al=
loc())
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (f53ab43553ea Fix typos in GPIO TODO docume=
nt)
Merging gpio-intel/for-next (12b0e305f509 gpio: acpi: switch to device_for_=
each_child_node_scoped())
Merging pinctrl/for-next (b8b23101552d Merge branch 'devel' into for-next)
Merging pinctrl-intel/for-next (21dcd49fb4aa Merge patch series "pinctrl: i=
ntel: platform: fix error path in device_for_each_child_node()")
Merging pinctrl-renesas/renesas-pinctrl (1325820dd085 pinctrl: renesas: rzg=
2l: Move pinconf_to_config_argument() call outside of switch cases)
Merging pinctrl-samsung/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging pwm/pwm/for-next (3d7d2d834cd3 Merge branch 'pwm/duty_offset')
Merging ktest/for-next (2351e8c65404 ktest.pl: Avoid false positives with g=
rub2 skip regex)
Merging kselftest/next (010b07d11e25 selftests: timers: improve timer_creat=
e failure message)
Merging kunit/test (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-next/kunit (9852d85ec9d4 Linux 6.12-rc1)
Merging livepatching/for-next (9fbf78b6d6ce Merge branch 'for-6.12/trivial'=
 into for-next)
Merging rtc/rtc-next (690286214916 rtc: rc5t619: use proper module tables)
Merging nvdimm/libnvdimm-for-next (447b167bb60d nvdimm: Remove dead code fo=
r ENODEV checking in scan_labels())
Merging at24/at24/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging ntb/ntb-next (811ef807a6a0 ntb_hw_switchtec: Fix shift-out-of-bound=
s in switchtec_ntb_mw_set_trans)
Merging seccomp/for-next/seccomp (de9c2c66ad8e Linux 6.11-rc2)
Merging fsi/next (c5eeb63edac9 fsi: Fix panic on scom file read)
Merging slimbus/for-next (8400291e289e Linux 6.11-rc1)
Merging nvmem/for-next (8400291e289e Linux 6.11-rc1)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (94e86b174d10 tools/hv: Add memory allocation ch=
eck in hv_fcopy_start)
Merging auxdisplay/for-next (e3a5eb4ad795 auxdisplay: Drop explicit initial=
ization of struct i2c_device_id::driver_data to 0)
Merging kgdb/kgdb/for-next (9bccbe7b2087 kdb: Get rid of redundant kdb_curr=
_task())
Merging hmm/hmm (6613476e225e Linux 6.8-rc1)
Merging cfi/cfi/next (9852d85ec9d4 Linux 6.12-rc1)
Merging mhi/mhi-next (84a5ae5b23ba bus: mhi: host: pci_generic: Enable EDL =
trigger for Foxconn modems)
Merging memblock/for-next (cb088e38aab4 s390/mm: get estimated free pages b=
y memblock api)
Merging cxl/next (2c70677dabb5 cxl: Add documentation to explain the shared=
 link bandwidth calculation)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (04736f7d1945 efi: Remove redundant null pointer checks in=
 efi_debugfs_init())
Merging unicode/for-next (156bb2c569cd unicode: Fix utf8_load() error path)
Merging slab/slab/for-next (ecc4d6af979b Merge branch 'slab/for-6.12/kmem_c=
ache_args' into slab/for-next)
Merging random/master (40b421fd7956 prandom: Include <linux/percpu.h> in <l=
inux/prandom.h>)
Applying: fix up for "random: Do not include <linux/prandom.h> in <linux/ra=
ndom.h>"
Merging landlock/next (e1b061b444fb Merge tag 'landlock-6.12-rc1' of git://=
git.kernel.org/pub/scm/linux/kernel/git/mic/linux)
Merging rust/rust-next (9852d85ec9d4 Linux 6.12-rc1)
Merging sysctl/sysctl-next (732b47db1d6c MAINTAINERS: update email for Joel=
 Granados)
Merging execve/for-next/execve (44f65d900698 binfmt_elf: mseal address zero)
Merging bitmap/bitmap-for-next (d7bcc37436c7 lib/test_bits.c: Add tests for=
 GENMASK_U128())
Merging hte/for-next (9e4259716f60 hte: tegra-194: add missing MODULE_DESCR=
IPTION() macro)
Merging kspp/for-next/kspp (c00ac1f9fd7b Merge branches 'for-linus/hardenin=
g' and 'for-next/hardening' into for-next/kspp)
Merging kspp-gustavo/for-next/kspp (6613476e225e Linux 6.8-rc1)
Merging nolibc/nolibc (9852d85ec9d4 Linux 6.12-rc1)
Merging tsm/tsm-next (f4738f56d1dc virt: tdx-guest: Add Quote generation su=
pport using TSM_REPORTS)
Merging iommufd/for-next (79805c1bbbf9 iommu: Set iommu_attach_handle->doma=
in in core)
Merging turbostat/next (a119348cb685 tools/power turbostat: Honor --show CP=
U, even when even when num_cpus=3D1)
Merging pwrseq/pwrseq/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)
Applying: fix up for "NLM/NFSD: Fix lock notifications for async-capable fi=
lesystems'

--Sig_/DcVuFfPCk5voHt.rHuJWWiE
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmb7ffYACgkQAVBC80lX
0GwOIAf+POMzncFX656EOeLe5vZWSc/p43e4P22xrQvybqf+UscVqgwyRbCCdu+p
sbG5Aex41H/ktEf/5cYExOzC/UGfB63gTXjUM9PO5HFqe3vdz0h60G4ek7pGkyE4
WZqxeWTyWwOt70Rm8zPhYTtvDRlrF6RpSp31qmSyZeQCUSgBW+JuSdQgxPl1r4+T
SlbKeojyPfc8NVn9sNwpi5gbrxg/2ko6BdqGc8HiUw9AoOApwiplcP4RK6JDEbpi
akP5WVrSx0HI23E/RpbYigL/YA7TxlpOQR5JUg9u7QcGV5i78db3baL3k+QU6i+s
6rizkgo2o45zbtBVaH72RVVZKYVDxA==
=/4Cm
-----END PGP SIGNATURE-----

--Sig_/DcVuFfPCk5voHt.rHuJWWiE--

