Return-Path: <linux-next+bounces-4173-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 073819960AD
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 09:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 086111C2109A
	for <lists+linux-next@lfdr.de>; Wed,  9 Oct 2024 07:20:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DDF617BB21;
	Wed,  9 Oct 2024 07:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b="SaiIrPJ2"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644CB178CC5;
	Wed,  9 Oct 2024 07:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=150.107.74.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728458425; cv=none; b=P9tZClNfgFec0BeILSe3uL1qnqciC/TCDaQeiWGQ4u7DbCxzvzkLF3obDpUTsTqc2Xu4NKkU4EF5xH7qGC2DxCgYREHnz6inb6DvnX7MDmxoJ5MdYB1aDuoh+LEnPWe8gq5j2cqh1jJEyyh3uscsLQRIun0xJp1v+PA1sbytCd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728458425; c=relaxed/simple;
	bh=D10Gl98C5IhTaBcmhrgP8EuK2+eJTkZ/HjuFgEx3dUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=I2rGLvE9BZ+Ex28E35ylClAeJrgwYqvbzqgbmkNuoPCmYictVp5FwDLBqID9DA6R/RWj+gFyWIcv8eX3pBWznQFi4vvGwRqSGzJuSQLt+3dM5hdzur9Xxe73u92yO+LW67crhjPSEatmtXLG5lxVUESVsMlcJKt4nr347RA7lzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au; spf=pass smtp.mailfrom=canb.auug.org.au; dkim=pass (2048-bit key) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.b=SaiIrPJ2; arc=none smtp.client-ip=150.107.74.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canb.auug.org.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canb.auug.org.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
	s=201702; t=1728458416;
	bh=+IB0bTG7zKZwY39pLeeqtn0mGJC6yzTn2VjxkLapIxU=;
	h=Date:From:To:Cc:Subject:From;
	b=SaiIrPJ2kwL/Nv541LBRdmU3bGALCBvM1DntG3LLciqNg7qkZAfUmrj+OeOSc+pLm
	 9P8sUgPc+Kvk0geiDPL04idaCafu+hLb9+Neqih7NWUf7xHWL71e3u8V21fijkbTNC
	 wDUi1At7fPy+0u5rZiF6P+0xhKkJySWsCj2bFljlpLy5kZ4R+Zmf0Jp9hbPXZ2ipql
	 o9uhzGuXwGbtaaVXNnBAr+5IiSMh3zUUXXqefydlwULMIz2TzHoI+ckA3sff3CMx5+
	 KRjEWs1+pMqe3DBgg3+t+rzkDRG9+wv5HqCIO5E2i2Evh3DozPOUqDSu6U0NfpSDJs
	 EFEvtAbVlFEQw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNkmw5LnPz4wxm;
	Wed,  9 Oct 2024 18:20:16 +1100 (AEDT)
Date: Wed, 9 Oct 2024 18:20:16 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: linux-next: Tree for Oct 9
Message-ID: <20241009182016.61736424@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Xo2zKQ64RJLju4fabaF4n6C";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/Xo2zKQ64RJLju4fabaF4n6C
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

News: this release fails my very simple qemu boot test.  It looks normal
up to user mode and I even get a login prompt, but when I log in I get
dumped back to the login prompt - presumably the shell is failing to run.

Changes since 20241008:

The vfs-brauner tree lost its build failure.

The wireless-next tree gained conflicts against Linus' tree.  It also
gained a build failure for which I revered a commit.

The amdgpu tree lost its build failure.

The tip tree gained a build failure for which I reverted a topic branch.

The pinctrl tree still had its build failure, so I used the version
from next-20241004.

The kunit-next tree gained a conflict against the mm tree.

Non-merge commits (relative to Linus' tree): 2906
 4083 files changed, 105658 insertions(+), 74689 deletions(-)

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

I am currently merging 377 trees (counting Linus' and 140 trees of bug
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
Merging origin/master (75b607fab38d Merge tag 'sched_ext-for-6.12-rc2-fixes=
' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext)
Merging fixes/fixes (87d6aab2389e Merge tag 'for_linus' of git://git.kernel=
.org/pub/scm/linux/kernel/git/mst/vhost)
Merging vfs-brauner-fixes/vfs.fixes (368196e50194 netfs: fix documentation =
build error)
Merging fscrypt-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging fsverity-current/for-current (256abd8e550c Linux 6.10-rc7)
Merging btrfs-fixes/next-fixes (857c0ad014a4 Merge branch 'misc-6.12' into =
next-fixes)
Merging vfs-fixes/fixes (678379e1d4f7 close_range(): fix the logics in desc=
riptor table trimming)
Merging erofs-fixes/fixes (98dd36c9fa08 erofs: ensure regular inodes for fi=
le-backed mounts)
Merging nfsd-fixes/nfsd-fixes (c88c150a467f nfsd: fix possible badness in F=
REE_STATEID)
Merging v9fs-fixes/fixes/next (684a64bf32b6 Merge tag 'nfs-for-6.12-1' of g=
it://git.linux-nfs.org/projects/anna/linux-nfs)
Merging overlayfs-fixes/ovl-fixes (77a28aa47687 ovl: relax WARN_ON in ovl_v=
erify_area())
Merging bcachefs/for-next (148693784ac8 bcachefs: Refactor new stripe path =
to reduce dependencies on ec_stripe_head)
Merging fscrypt/for-next (256abd8e550c Linux 6.10-rc7)
Merging afs/afs-next (abcbd3bfbbfe afs: trace: Log afs_make_call(), includi=
ng server address)
Merging btrfs/for-next (d79b0f10eed9 Merge branch 'for-next-next-v6.12-2024=
1008' into for-next-20241008)
Merging ceph/master (ccda9910d849 ceph: fix cap ref leak via netfs init_req=
uest)
Merging cifs/for-next (e25f5175ef11 smb: client: stop flooding dmesg with a=
utomounts)
Merging configfs/for-next (4425c1d9b44d configfs: improve item creation per=
formance)
Merging dlm/next (dfe5a6cc4204 dlm: make add_to_waiters() that it can't fai=
l)
Merging erofs/dev (9852d85ec9d4 Linux 6.12-rc1)
Merging exfat/dev (cb7d85014fb1 MAINTAINERS: exfat: add myself as reviewer)
Merging exportfs/exportfs-next (98f7e32f20d2 Linux 6.11)
Merging ext3/for_next (282f03136b06 Merge fsnotify fixes.)
Merging ext4/dev (6121258c2b33 ext4: fix off by one issue in alloc_flex_gd(=
))
Merging f2fs/dev (8cf0b93919e1 Linux 6.12-rc2)
Merging fsverity/for-next (256abd8e550c Linux 6.10-rc7)
Merging fuse/for-next (639ee6854c0f virtiofs: use GFP_NOFS when enqueuing r=
equest through kworker)
Merging gfs2/for-next (7e4a0a50b403 KMSAN: uninit-value in inode_go_dump (5=
))
Merging jfs/jfs-next (2b59ffad47db jfs: Fix uninit-value access of new_ea i=
n ea_buffer)
Merging ksmbd/ksmbd-for-next (8cf0b93919e1 Linux 6.12-rc2)
Merging nfs/linux-next (67784a74e258 Merge tag 'ata-6.11-rc7' of git://git.=
kernel.org/pub/scm/linux/kernel/git/libata/linux)
Merging nfs-anna/linux-next (76f5af995206 nfsd/localio: fix nfsd_file trace=
points to handle NULL rqstp)
Merging nfsd/nfsd-next (5d063672154b nfsd: Fill NFSv4.1 server implementati=
on fields in OP_EXCHANGE_ID response)
Merging ntfs3/master (48dbc127836a fs/ntfs3: Format output messages like ot=
hers fs in kernel)
Merging orangefs/for-next (96319dacaf15 orangefs: Constify struct kobj_type)
Merging overlayfs/overlayfs-next (87d8f162a474 ovl: convert ovl_real_fdget(=
) callers to ovl_real_file())
Merging ubifs/next (92a286e90203 ubi: Fix ubi_init() ubiblock_exit() sectio=
n mismatch)
Merging v9fs/9p-next (79efebae4afc 9p: Avoid creating multiple slab caches =
with the same name)
Merging v9fs-ericvh/ericvh/for-next (684a64bf32b6 Merge tag 'nfs-for-6.12-1=
' of git://git.linux-nfs.org/projects/anna/linux-nfs)
Merging xfs/for-next (44adde15022d xfs: fix a typo)
Merging zonefs/for-next (c4b3c1332f55 zonefs: add support for FS_IOC_GETFSS=
YSFSPATH)
Merging file-locks/locks-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6-=
mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging iversion/iversion-next (e0152e7481c6 Merge tag 'riscv-for-linus-6.6=
-mw1' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux)
Merging vfs-brauner/vfs.all (7c8e7e4b5e15 Merge branch 'vfs.file' into vfs.=
all Signed-off-by: Christian Brauner <brauner@kernel.org>)
Merging vfs/for-next (8f602276d390 Merge tag 'bcachefs-2024-10-05' of git:/=
/evilpiepirate.org/bcachefs)
Merging mm-hotfixes/mm-hotfixes-unstable (6701cc0b4698 fs/proc: fix build w=
ith GCC 15 due to -Werror=3Dunterminated-string-initialization)
Merging fs-current (0d4570f02fe8 Merge branch 'nfsd-fixes' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/cel/linux)
Merging kbuild-current/fixes (8cf0b93919e1 Linux 6.12-rc2)
Merging arc-current/for-curr (8bf275d61925 arc: rename aux.h to arc_aux.h)
Merging arm-current/fixes (0c66c6f4e21c ARM: 9359/1: flush: check if the fo=
lio is reserved for no-mapping addresses)
Merging arm64-fixes/for-next/fixes (3eddb108abe3 arm64: Subscribe Microsoft=
 Azure Cobalt 100 to erratum 3194386)
Merging arm-soc-fixes/arm/fixes (0e7af99aef5f Merge tag 'riscv-soc-fixes-fo=
r-v6.11-final' of https://git.kernel.org/pub/scm/linux/kernel/git/conor/lin=
ux into arm/fixes)
Merging davinci-current/davinci/for-current (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging sophgo-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging m68k-current/for-linus (b90fae5df917 m68k: defconfig: Update defcon=
figs for v6.11-rc1)
Merging powerpc-fixes/fixes (4b058c9f281f powerpc/vdso: allow r30 in vDSO c=
ode generation of getrandom)
Merging s390-fixes/fixes (98f7e32f20d2 Linux 6.11)
Merging net/main (1fd9e4f25782 selftests: make kselftest-clean remove libyn=
l outputs)
Merging bpf/master (b24d7f0da6ef bpf, lsm: Remove bpf_lsm_key_free hook)
Merging ipsec/master (645546a05b03 xfrm: policy: remove last remnants of pe=
rnet inexact list)
Merging netfilter/main (8beee4d8dee7 sctp: set sk_state back to CLOSED if a=
utobind fails in sctp_listen_start)
Merging ipvs/main (8beee4d8dee7 sctp: set sk_state back to CLOSED if autobi=
nd fails in sctp_listen_start)
Merging wireless/for-next (52009b419355 wifi: mac80211: skip non-uploaded k=
eys in ieee80211_iter_keys)
Merging ath/for-current (2f833e8948d6 Revert "wifi: ath11k: support hiberna=
tion")
Merging wpan/master (09573b1cc76e net: ieee802154: mcr20a: Use IRQF_NO_AUTO=
EN flag in request_irq())
Merging rdma-fixes/for-rc (6ff57a2ea7c2 RDMA/nldev: Fix NULL pointer derefe=
rences issue in rdma_nl_notify_event)
Merging sound-current/for-linus (cf2069e82233 ALSA: hda: tas2781: Simplify =
system PM with runtime PM)
Merging sound-asoc-fixes/for-linus (9814c1447f9c ASoC: SOF: Intel: hda-load=
er: do not wait for HDaudio IOC)
Merging regmap-fixes/for-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging regulator-fixes/for-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging spi-fixes/for-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging pci-current/for-linus (9852d85ec9d4 Linux 6.12-rc1)
Merging driver-core.current/driver-core-linus (bd2b7f62a0d5 mailmap: update=
 mail for Fiona Behrens)
Merging tty.current/tty-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging usb.current/usb-linus (39845764a0ca USB: yurex: kill needless initi=
alization in yurex_read)
Merging usb-serial-fixes/usb-linus (9852d85ec9d4 Linux 6.12-rc1)
Merging phy/fixes (2d0f973b5f1c phy: cadence: Sierra: Fix offset of DEQ ope=
n eye algorithm control register)
Merging staging.current/staging-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging iio-fixes/fixes-togreg (ccf9af8b0dad iioc: dac: ltc2664: Fix span v=
ariable usage in ltc2664_channel_config())
Merging counter-current/counter-current (9852d85ec9d4 Linux 6.12-rc1)
Merging char-misc.current/char-misc-linus (8cf0b93919e1 Linux 6.12-rc2)
Merging soundwire-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging thunderbolt-fixes/fixes (8cf0b93919e1 Linux 6.12-rc2)
Merging input-current/for-linus (c684771630e6 Input: adp5589-keys - fix adp=
5589_gpio_get_value())
Merging crypto-current/master (44ac4625ea00 crypto: powerpc/p10-aes-gcm - D=
isable CRYPTO_AES_GCM_P10)
Merging vfio-fixes/for-linus (5a88a3f67e37 vfio/pci: Init the count variabl=
e in collecting hot-reset devices)
Merging kselftest-fixes/fixes (34d5b600172b selftests: vDSO: Explicitly inc=
lude sched.h)
Merging dmaengine-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging backlight-fixes/for-backlight-fixes (1613e604df0c Linux 6.10-rc1)
Merging mtd-fixes/mtd/fixes (bd92c1e07beb mtd: hyperbus: rpc-if: Add missin=
g MODULE_DEVICE_TABLE)
Merging mfd-fixes/for-mfd-fixes (68f860426d50 mfd: axp20x: AXP717: Fix miss=
ing IRQ status registers range)
Merging v4l-dvb-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging reset-fixes/reset/fixes (2cf596636607 reset: starfive: jh71x0: Fix =
accessing the empty member on JH7110 SoC)
Merging mips-fixes/mips-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging at91-fixes/at91-fixes (e9408fa234fb MAINTAINERS: Update DTS path fo=
r ARM/Microchip (AT91) SoC)
Merging omap-fixes/fixes (5062d9c0cbbc ARM: dts: omap3-n900: correct the ac=
celerometer orientation)
Merging kvm-fixes/master (c8d430db8eec Merge tag 'kvmarm-fixes-6.12-1' of g=
it://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvms390-fixes/master (cff59d8631e1 s390/uv: Panic for set and remov=
e shared access UVC errors)
Merging hwmon-fixes/hwmon (2d6c668902e5 hwmon: (max1668) Add missing depend=
ency on REGMAP_I2C)
Merging nvdimm-fixes/libnvdimm-fixes (d5240fa65db0 nvdimm/pmem: Set dax fla=
g for all 'PFN_MAP' cases)
Merging cxl-fixes/fixes (ee1e3c46ed19 EINJ, CXL: Fix CXL device SBDF calcul=
ation)
Merging dma-mapping-fixes/for-linus (75961ffb5cb3 swiotlb: initialise restr=
icted pool list_head when SWIOTLB_DYNAMIC=3Dy)
Merging drivers-x86-fixes/fixes (2fae3129c0c0 platform/x86: x86-android-tab=
lets: Fix use after free on platform_device_register() errors)
Merging samsung-krzk-fixes/fixes (a03c246d4ec8 clk: samsung: Fix out-of-bou=
nd access of of_match_node())
Merging pinctrl-samsung-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging devicetree-fixes/dt/linus (6df119781514 dt-bindings: interrupt-cont=
roller: fsl,ls-extirq: workaround wrong interrupt-map number)
Merging dt-krzk-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging scsi-fixes/fixes (d539a871ae47 scsi: scsi_transport_fc: Allow setti=
ng rport state to current state)
Merging drm-fixes/drm-fixes (8cf0b93919e1 Linux 6.12-rc2)
Merging drm-intel-fixes/for-linux-next-fixes (4cc2718f621a drm/i915/hdcp: f=
ix connector refcounting)
Merging mmc-fixes/fixes (5b35746a0fdc Revert "mmc: mvsdio: Use sg_miter for=
 PIO")
Merging rtc-fixes/rtc-fixes (8400291e289e Linux 6.11-rc1)
Merging gnss-fixes/gnss-linus (9852d85ec9d4 Linux 6.12-rc1)
Merging hyperv-fixes/hyperv-fixes (895384881ec9 hv: vmbus: Constify struct =
kobj_type and struct attribute_group)
Merging risc-v-fixes/fixes (cfb10de18538 riscv: Fix kernel stack size when =
KASAN is enabled)
Merging riscv-dt-fixes/riscv-dt-fixes (7d9d88890f04 MAINTAINERS: invert Mis=
c RISC-V SoC Support's pattern)
Merging riscv-soc-fixes/riscv-soc-fixes (61f2e8a3a941 riscv: dts: starfive:=
 jh7110-common: Fix lower rate of CPUfreq by setting PLL0 rate to 1.5GHz)
Merging fpga-fixes/fixes (1613e604df0c Linux 6.10-rc1)
Merging spdx/spdx-linus (47ac09b91bef Linux 6.11-rc4)
Merging gpio-brgl-fixes/gpio/for-current (a6191a3d1811 gpio: aspeed: Use de=
vm_clk api to manage clock source)
Merging gpio-intel-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pinctrl-intel-fixes/fixes (37756257093b pinctrl: intel: platform: A=
dd Panther Lake to the list of supported)
Merging auxdisplay-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-fixes/kunit-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging memblock-fixes/fixes (8043832e2a12 memblock: use numa_valid_node() =
helper to check for invalid node ID)
Merging renesas-fixes/fixes (8c987693dc2d ARM: dts: renesas: rcar-gen2: Add=
 missing #interrupt-cells to DA9063 nodes)
Merging perf-current/perf-tools (e934a35e3cc1 perf cs-etm: Fix the assert()=
 to handle captured and unprocessed cpu trace)
Merging efi-fixes/urgent (ae835a96d72c x86/efistub: Revert to heap allocate=
d boot_params for PE entrypoint)
Merging zstd-fixes/zstd-linus (77618db34645 zstd: Fix array-index-out-of-bo=
unds UBSAN warning)
Merging battery-fixes/fixes (7c626ce4bae1 Linux 6.11-rc3)
Merging iommufd-fixes/for-rc (9852d85ec9d4 Linux 6.12-rc1)
Merging rust-fixes/rust-fixes (ab8851431bef lib/Kconfig.debug: fix grammar =
in RUST_BUILD_ASSERT_ALLOW)
Merging w1-fixes/fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pmdomain-fixes/fixes (500580c7ae7b pmdomain: qcom-cpr: Fix the retu=
rn of uninitialized variable)
Merging i2c-host-fixes/i2c/i2c-host-fixes (048bbbdbf85e i2c: stm32f7: Do no=
t prepare/unprepare clock during runtime suspend/resume)
Merging sparc-fixes/for-linus (6613476e225e Linux 6.8-rc1)
Merging clk-fixes/clk-fixes (9852d85ec9d4 Linux 6.12-rc1)
Merging pwrseq-fixes/pwrseq/for-current (a85bbe01a320 power: sequencing: ma=
ke the QCom PMU pwrseq driver depend on CONFIG_OF)
Merging thead-dt-fixes/thead-dt-fixes (8400291e289e Linux 6.11-rc1)
Merging drm-misc-fixes/for-linux-next-fixes (835745a377a4 nouveau/dmem: Fix=
 vulnerability in migrate_to_ram upon copy error)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_submit.c
Merging mm-stable/mm-stable (8cf0b93919e1 Linux 6.12-rc2)
Merging mm-nonmm-stable/mm-nonmm-stable (8cf0b93919e1 Linux 6.12-rc2)
Merging mm/mm-everything (3a83423f8422 foo)
Merging kbuild/for-next (f8746e3712be kconfig: remove zconfprint())
Merging clang-format/clang-format (c147f663b6a5 clang-format: Update with v=
6.11-rc1's `for_each` macro list)
Merging perf/perf-tools-next (6bff76af9635 perf test attr: Add back missing=
 topdown events)
Merging compiler-attributes/compiler-attributes (98f7e32f20d2 Linux 6.11)
Merging dma-mapping/for-next (bfc4a245a794 dma-mapping: fix DMA API tracing=
 for chained scatterlists)
Merging asm-generic/master (f822712a2c69 UAPI/ioctl: Improve parameter name=
 of ioctl request definition helpers)
Merging arc/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging arm/for-next (9016915e3c5f Merge branches 'amba', 'fixes' and 'misc=
' into for-next)
Merging arm64/for-next/core (bb9ae1a66c85 kselftest/arm64: Enable GCS for t=
he FP stress tests)
Merging arm-perf/for-next/perf (7c626ce4bae1 Linux 6.11-rc3)
Merging arm-soc/for-next (7c590fea8c11 soc: document merges)
Merging amlogic/for-next (c0f04972d35b Merge branch 'v6.13/arm-dt' into for=
-next)
Merging asahi-soc/asahi-soc/for-next (ffc253263a13 Linux 6.6)
Merging aspeed/for-next (b4c322c2783a ARM: dts: aspeed: catalina: Update io=
 expander line names)
Merging at91/at91-next (ee735afc2dae Merge branch 'at91-soc' into at91-next)
Merging broadcom/next (9c677db86ad6 Merge branch 'soc/next' into next)
Merging davinci/davinci/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging drivers-memory/for-next (89e6684538f5 dt-bindings: memory-controlle=
rs: fsl,ifc: split child node differences)
Merging imx-mxs/for-next (995b96e17150 Merge branch 'imx/dt64' into for-nex=
t)
Merging mediatek/for-next (8f8d13c8e3e0 arm64: dts: mediatek: mt8188: Add e=
DP and DP TX nodes)
Merging mvebu/for-next (841dd5b122b4 arm64: dts: marvell: cn9130-sr-som: fi=
x cp0 mdio pin numbers)
Merging omap/for-next (f45840d172a0 Merge branch 'omap-for-v6.13/drivers' i=
nto tmp/omap-next-20241004.145243)
Merging qcom/for-next (cea73ac3d218 Merge branches 'arm32-for-6.13', 'arm64=
-fixes-for-6.12', 'arm64-for-6.13', 'clk-for-6.13', 'drivers-fixes-for-6.12=
' and 'drivers-for-6.13' into for-next)
Merging renesas/next (d3e4a4cb9c36 Merge branch 'renesas-dts-for-v6.13' int=
o renesas-next)
Merging reset/reset/next (c0260e2b0ed8 reset: uniphier-glue: Use devm_reset=
_control_bulk_get_shared_deasserted())
Merging rockchip/for-next (72b4e3c06036 Merge branch 'v6.12-armsoc/dtsfixes=
' into for-next)
Merging samsung-krzk/for-next (3a2ff7ebe652 Merge branch 'next/dt64' into f=
or-next)
Merging scmi/for-linux-next (646a799a3f96 Merge branches 'for-next/ffa/fixe=
s' and 'for-next/scmi/updates' of ssh://gitolite.kernel.org/pub/scm/linux/k=
ernel/git/sudeep.holla/linux into for-linux-next)
Merging sophgo/for-next (30003e3f802e riscv: dts: sophgo: cv1812h: add pinc=
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
Merging xilinx/for-next (0e355cb69e19 Merge branch 'zynq/soc' into for-next)
Merging clk/clk-next (9852d85ec9d4 Linux 6.12-rc1)
Merging clk-imx/for-next (32c055ef563c clk: imx6ul: fix clock parent for IM=
X6UL_CLK_ENETx_REF_SEL)
Merging clk-renesas/renesas-clk (44d13e198cbf clk: renesas: r9a09g057: Add =
clock and reset entries for ICU)
Merging csky/linux-next (2c40c1c6adab Merge tag 'usb-6.7-rc1' of git://git.=
kernel.org/pub/scm/linux/kernel/git/gregkh/usb)
Merging loongarch/loongarch-next (f339bd3b51da Docs/LoongArch: Add advanced=
 extended IRQ model description)
Merging m68k/for-next (b90fae5df917 m68k: defconfig: Update defconfigs for =
v6.11-rc1)
Merging m68knommu/for-next (8cf0b93919e1 Linux 6.12-rc2)
Merging microblaze/next (badf752b5e4b microblaze: Export xmb_manager functi=
ons)
Merging mips/mips-next (9852d85ec9d4 Linux 6.12-rc1)
Merging openrisc/for-next (4dc70e1aadfa openrisc: Move FPU state out of pt_=
regs)
Merging parisc-hd/for-next (98f7e32f20d2 Linux 6.11)
Merging powerpc/next (9852d85ec9d4 Linux 6.12-rc1)
Merging risc-v/for-next (1540def11f0c Merge patch series "riscv: Per-thread=
 envcfg CSR support")
Merging riscv-dt/riscv-dt-for-next (8400291e289e Linux 6.11-rc1)
Merging riscv-soc/riscv-soc-for-next (8400291e289e Linux 6.11-rc1)
Merging s390/for-next (2d8721364ce8 s390/vfio-ap: Driver feature advertisem=
ent)
Merging sh/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging sparc/for-next (d21dffe51baa arch/sparc: remove unused varible padd=
rbase in function leon_swprobe())
Merging uml/next (381d2f95c8aa um: fix time-travel syscall scheduling hack)
Merging xtensa/xtensa-for-next (b7cf2a1d9881 xtensa: remove redundant flush=
_dcache_page and ARCH_IMPLEMENTS_FLUSH_DCACHE_PAGE macros)
Merging fs-next (b41d67c149df Merge branch 'vfs.all' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/vfs/vfs.git)
Applying: Reapply "mm: introduce PF_MEMALLOC_NORECLAIM, PF_MEMALLOC_NOWARN"
Merging printk/for-next (ebdf88c2479b Merge branch 'for-6.13' into for-next)
Merging pci/next (6437627cb582 Merge branch 'pci/misc')
Merging pstore/for-next/pstore (1bf8012fc699 pstore: replace spinlock_t by =
raw_spinlock_t)
Merging hid/for-next (aaff669a7ffe Merge branch 'for-6.12/upstream-fixes' i=
nto for-next)
Merging i2c/i2c/for-next (3b2af08fadc4 i2c: core: Remove extra space in Mak=
efile)
Merging i2c-host/i2c/i2c-host (663bff1ddfe4 i2c: designware: Add a new ACPI=
 HID for HJMC01 I2C controller)
Merging i3c/i3c/next (618507257797 i3c: master: svc: Fix use after free vul=
nerability in svc_i3c_master Driver Due to Race Condition)
Merging dmi/dmi-for-next (4d1b28a8119c firmware: dmi: Add info message for =
number of populated and total memory slots)
Merging hwmon-staging/hwmon-next (0667a5e1edfa hwmon: (max31827) Fix spelli=
ng errors reported by codespell)
Merging jc_docs/docs-next (6d41cc46619c Documentation/tracing: Mention that=
 RESET_ATTACK_MITIGATION can clear memory)
Merging v4l-dvb/next (67cefecf2a03 mailmap: add entries for Hans Verkuil)
Merging v4l-dvb-next/master (b36c41c51e9d media: atomisp: set lock before c=
alling vb2_queue_init())
Merging pm/linux-next (04fe2b1b0ff5 Merge branch 'pm-powercap' into linux-n=
ext)
Merging cpufreq-arm/cpufreq/arm/linux-next (ea1829d4d413 cppc_cpufreq: Remo=
ve HiSilicon CPPC workaround)
Merging cpupower/cpupower (b6a2dbf88aa7 pm: cpupower: bindings: Add test to=
 confirm cpu state is disabled)
Merging devfreq/devfreq-next (d47552124bb0 PM / devfreq: imx-bus: Use of_pr=
operty_present())
Merging pmdomain/next (69f4d1b1cba7 pmdomain: Merge branch fixes into next)
Merging opp/opp/linux-next (53205a790366 dt-bindings: opp: operating-points=
-v2-ti-cpu: Describe opp-supported-hw)
Merging thermal/thermal/linux-next (7d8abc5f3b5c thermal/drivers/imx_sc_the=
rmal: Use dev_err_probe)
Merging rdma/for-next (615b94746a54 RDMA/hns: Disassociate mmap pages for a=
ll uctx when HW is being reset)
Merging net-next/main (33019c70ae4d Merge branch 'selftests-mlxsw-stabilize=
-red-tests')
Merging bpf-next/for-next (98d9c5fae1f1 Merge branch 'bpf-next/net' into fo=
r-next)
Merging ipsec-next/master (8b641b5e4c78 hv_netvsc: Link queues to NAPIs)
Merging mlx5-next/mlx5-next (8cf0b93919e1 Linux 6.12-rc2)
Merging netfilter-next/main (f66ebf37d69c Merge git://git.kernel.org/pub/sc=
m/linux/kernel/git/netdev/net)
Merging ipvs-next/main (f66ebf37d69c Merge git://git.kernel.org/pub/scm/lin=
ux/kernel/git/netdev/net)
Merging bluetooth/master (039468a21912 Bluetooth: btnxpuart: Add GPIO suppo=
rt to power save feature)
  81b3e33bb054 ("Bluetooth: btusb: Don't fail external suspend requests")
  a691ff3d3280 ("Bluetooth: hci_conn: Fix UAF in hci_enhanced_setup_sync")
  ffb3f98d4dae ("Bluetooth: RFCOMM: FIX possible deadlock in rfcomm_sk_stat=
e_change")
Merging wireless-next/for-next (ff919efb5fe8 wireless: wext: shorten struct=
 iw_ioctl_description)
CONFLICT (content): Merge conflict in drivers/net/wireless/intel/ipw2x00/li=
bipw_crypto_tkip.c
CONFLICT (modify/delete): drivers/staging/ks7010/TODO deleted in HEAD and m=
odified in wireless-next/for-next.  Version wireless-next/for-next of drive=
rs/staging/ks7010/TODO left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtl8192e/r8190P_def.h de=
leted in wireless-next/for-next and modified in HEAD.  Version HEAD of driv=
ers/staging/rtl8192e/rtl8192e/r8190P_def.h left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c=
 deleted in wireless-next/for-next and modified in HEAD.  Version HEAD of d=
rivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c de=
leted in wireless-next/for-next and modified in HEAD.  Version HEAD of driv=
ers/staging/rtl8192e/rtl8192e/r8192E_dev.c left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h del=
eted in wireless-next/for-next and modified in HEAD.  Version HEAD of drive=
rs/staging/rtl8192e/rtl8192e/r8192E_hw.h left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c de=
leted in wireless-next/for-next and modified in HEAD.  Version HEAD of driv=
ers/staging/rtl8192e/rtl8192e/r8192E_phy.c left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h de=
leted in wireless-next/for-next and modified in HEAD.  Version HEAD of driv=
ers/staging/rtl8192e/rtl8192e/r8192E_phy.h left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtl8192e/rtl_core.c dele=
ted in wireless-next/for-next and modified in HEAD.  Version HEAD of driver=
s/staging/rtl8192e/rtl8192e/rtl_core.c left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtl8192e/rtl_core.h dele=
ted in wireless-next/for-next and modified in HEAD.  Version HEAD of driver=
s/staging/rtl8192e/rtl8192e/rtl_core.h left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtl8192e/rtl_dm.c delete=
d in wireless-next/for-next and modified in HEAD.  Version HEAD of drivers/=
staging/rtl8192e/rtl8192e/rtl_dm.c left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtl8192e/rtl_ps.c delete=
d in wireless-next/for-next and modified in HEAD.  Version HEAD of drivers/=
staging/rtl8192e/rtl8192e/rtl_ps.c left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtl8192e/rtl_wx.c delete=
d in wireless-next/for-next and modified in HEAD.  Version HEAD of drivers/=
staging/rtl8192e/rtl8192e/rtl_wx.c left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtl819x_BAProc.c deleted=
 in wireless-next/for-next and modified in HEAD.  Version HEAD of drivers/s=
taging/rtl8192e/rtl819x_BAProc.c left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtl819x_HTProc.c deleted=
 in wireless-next/for-next and modified in HEAD.  Version HEAD of drivers/s=
taging/rtl8192e/rtl819x_HTProc.c left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtl819x_TSProc.c deleted=
 in wireless-next/for-next and modified in HEAD.  Version HEAD of drivers/s=
taging/rtl8192e/rtl819x_TSProc.c left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtllib.h deleted in wire=
less-next/for-next and modified in HEAD.  Version HEAD of drivers/staging/r=
tl8192e/rtllib.h left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtllib_rx.c deleted in w=
ireless-next/for-next and modified in HEAD.  Version HEAD of drivers/stagin=
g/rtl8192e/rtllib_rx.c left in tree.
CONFLICT (modify/delete): drivers/staging/rtl8192e/rtllib_softmac_wx.c dele=
ted in wireless-next/for-next and modified in HEAD.  Version HEAD of driver=
s/staging/rtl8192e/rtllib_softmac_wx.c left in tree.
$ git rm -f drivers/staging/ks7010/TODO
$ git rm -f drivers/staging/rtl8192e/rtl8192e/r8190P_def.h drivers/staging/=
rtl8192e/rtl8192e/r8192E_cmdpkt.c drivers/staging/rtl8192e/rtl8192e/r8192E_=
dev.c drivers/staging/rtl8192e/rtl8192e/r8192E_hw.h drivers/staging/rtl8192=
e/rtl8192e/r8192E_phy.c drivers/staging/rtl8192e/rtl8192e/r8192E_phy.h driv=
ers/staging/rtl8192e/rtl8192e/rtl_core.c drivers/staging/rtl8192e/rtl8192e/=
rtl_core.h drivers/staging/rtl8192e/rtl8192e/rtl_dm.c drivers/staging/rtl81=
92e/rtl8192e/rtl_ps.c drivers/staging/rtl8192e/rtl8192e/rtl_wx.c drivers/st=
aging/rtl8192e/rtl819x_BAProc.c drivers/staging/rtl8192e/rtl819x_HTProc.c d=
rivers/staging/rtl8192e/rtl819x_TSProc.c drivers/staging/rtl8192e/rtllib.h =
drivers/staging/rtl8192e/rtllib_rx.c drivers/staging/rtl8192e/rtllib_softma=
c_wx.c
Applying: Revert "wifi: cfg80211: unexport wireless_nlevent_flush()"
Merging ath-next/for-next (4c57ec6c4bb9 wifi: ath11k: Fix CE offset address=
 calculation for WCN6750 in SSR)
Merging wpan-next/master (ac49b950bea9 dt-bindings: net: add Microchip's LA=
N865X 10BASE-T1S MACPHY)
Merging wpan-staging/staging (ac49b950bea9 dt-bindings: net: add Microchip'=
s LAN865X 10BASE-T1S MACPHY)
Merging mtd/mtd/next (869acb874f2b Merge tag 'nand/for-6.12' into mtd/next)
Merging nand/nand/next (475aadeba5df mtd: spinand: macronix: Flag parts nee=
ding explicit plane select)
Merging spi-nor/spi-nor/next (afe1ea1344bb mtd: spi-nor: add support for Ma=
cronix Octal flash)
Merging crypto/master (452c55dcefa9 crypto: hisilicon/qm - fix the coding s=
pecifications issue)
Merging drm/drm-next (8cf0b93919e1 Linux 6.12-rc2)
Merging drm-exynos/for-linux-next (5b272bf7dcf9 Merge tag 'drm-xe-fixes-202=
4-10-03' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-fixes)
Merging drm-misc/for-linux-next (2c34a5464007 drm: use drm_file client_name=
 in fdinfo)
CONFLICT (content): Merge conflict in drivers/gpu/drm/panthor/panthor_drv.c
Merging amdgpu/drm-next (01b64bc063d0 drm/radeon: always set GEM function p=
ointer)
CONFLICT (content): Merge conflict in drivers/gpu/drm/amd/display/dc/dc_typ=
es.h
Merging drm-intel/for-linux-next (d92df66fd3e7 drm/i915/psr: Implement Wa 1=
4019834836)
Merging drm-msm/msm-next (a20a91fb1bfa Documentation: document adreno preem=
ption)
Merging drm-msm-lumag/msm-next-lumag (15302579373e drm/msm/dpu: enable writ=
eback on SM6350)
Merging drm-xe/drm-xe-next (0f1fdf559225 drm/xe/guc: Save manual engine cap=
ture into capture list)
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_gt_mcr.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_guc_submit.c
CONFLICT (content): Merge conflict in drivers/gpu/drm/xe/xe_tuning.c
Applying: fix up for "drm/xe: Wire up device shutdown handler"
Merging etnaviv/etnaviv/next (704d3d60fec4 drm/etnaviv: don't block schedul=
er when GPU is still active)
Merging fbdev/for-next (01ecc142ef7c fbdev: Switch back to struct platform_=
driver::remove())
Merging regmap/for-next (c2288599691c regmap: Merge up v6.12-rc2)
Merging sound/for-next (1ceb43eb6035 ALSA: aica: Remove unused variable)
Merging ieee1394/for-next (8f04019d71cb firewire: Correct some typos)
Merging sound-asoc/for-next (d19f6bf5f17d Merge remote-tracking branch 'aso=
c/for-6.13' into asoc-next)
Merging modules/modules-next (b319cea80539 module: Refine kmemleak scanned =
areas)
Merging input/next (515ef92b4939 Input: correct typos in multiple comments =
across misc drivers)
Merging block/for-next (7a84944a4bf7 Merge branch 'for-6.13/block' into for=
-next)
Merging device-mapper/for-next (579b2ba40ece dm verity: fallback to platfor=
m keyring also if key in trusted keyring is rejected)
Merging libata/for-next (794007a8c848 ata: Fix typos in the comment)
Merging pcmcia/pcmcia-next (0630e3bc0e91 pcmcia: add missing MODULE_DESCRIP=
TION() macros)
Merging mmc/next (713863d7b7ec mmc: davinci: use generic device_get_match_d=
ata())
Applying: fix up for "mmc: core: Adjust ACMD22 to SDUC"
Merging mfd/for-mfd-next (f7efea4fcf4b mfd: tps65010: Use IRQF_NO_AUTOEN fl=
ag in request_irq() to fix race)
Merging backlight/for-backlight-next (1a2dc9bf3b15 backlight: ktz8866: Fix =
module autoloading)
Merging battery/for-next (e50a57d16f89 power: supply: hwmon: Fix missing te=
mp1_max_alarm attribute)
Merging regulator/for-next (4e9a2c91bff4 regulator: dt-bindings: vctrl-regu=
lator: convert to YAML)
Merging security/next (c5e3cdbf2afe tomoyo: revert CONFIG_SECURITY_TOMOYO_L=
KM support)
Merging apparmor/apparmor-next (8400291e289e Linux 6.11-rc1)
Merging integrity/next-integrity (fa8a4ce432e8 ima: fix buffer overrun in i=
ma_eventdigest_init_common)
Merging selinux/next (d7b6918e22c7 selinux: Deprecate /sys/fs/selinux/user)
Merging smack/next (2749749afa07 smackfs: Use rcu_assign_pointer() to ensur=
e safe assignment in smk_set_cipso)
Merging tomoyo/master (ada1986d0797 tomoyo: fallback to realpath if symlink=
's pathname does not exist)
Merging tpmdd/next (558bdc45dfb2 sign-file,extract-cert: use pkcs11 provide=
r for OPENSSL MAJOR >=3D 3)
Merging watchdog/master (9852d85ec9d4 Linux 6.12-rc1)
Merging iommu/next (97162f6093d2 Merge branches 'fixes', 'arm/smmu', 'intel=
/vt-d', 'amd/amd-vi' and 'core' into next)
Merging audit/next (2132b355267f audit: Reorganize kerneldoc parameter name=
s)
Merging devicetree/for-next (1d31c6fc86c0 dt-bindings: writing-schema: Add =
details on YAML text blocks)
Merging dt-krzk/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging mailbox/for-next (54595f2807d2 mailbox, remoteproc: omap2+: fix com=
pile testing)
Merging spi/for-next (c2a59c892f20 spi: Merge up v6.12)
Merging tip/master (9f8718723ec6 Merge branch into tip/master: 'x86/misc')
Applying: Revert "Merge branch into tip/master: 'sched/core'"
Merging clockevents/timers/drivers/next (d7a87891e2f5 platform/x86:intel/pm=
c: fix build regression with pmtimer turned off)
Merging edac/edac-for-next (61124f42dcaa Merge ras/edac-drivers into for-ne=
xt)
Merging ftrace/for-next (f8a50cc19bec Merge ftrace/for-next)
Merging rcu/next (355debb83bf7 Merge branches 'context_tracking.15.08.24a',=
 'csd.lock.15.08.24a', 'nocb.09.09.24a', 'rcutorture.14.08.24a', 'rcustall.=
09.09.24a', 'srcu.12.08.24a', 'rcu.tasks.14.08.24a', 'rcu_scaling_tests.15.=
08.24a', 'fixes.12.08.24a' and 'misc.11.08.24a' into next.09.09.24a)
Merging paulmck/non-rcu/next (3b27dde7b75d Merge branches 'cmpxchg.2024.09.=
13a', 'lkmm.2024.09.14a', 'kcsan.2024.08.01a' and 'misc.2024.08.02a' into H=
EAD)
Merging kvm/next (c8d430db8eec Merge tag 'kvmarm-fixes-6.12-1' of git://git=
.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm into HEAD)
Merging kvm-arm/next (17a000564499 Merge branch kvm-arm64/visibility-cleanu=
ps into kvmarm-master/next)
Merging kvms390/next (f9b56b2c31e5 s390: Enable KVM_S390_UCONTROL config in=
 debug_defconfig)
Merging kvm-ppc/topic/ppc-kvm (9852d85ec9d4 Linux 6.12-rc1)
Merging kvm-riscv/riscv_kvm_next (5aa09297a3dc RISC-V: KVM: Fix to allow hp=
mcounter31 from the guest)
Merging kvm-x86/next (8cf0b93919e1 Linux 6.12-rc2)
Merging xen-tip/linux-next (bf56c410162d x86/xen: mark boot CPU of PV guest=
 in MSR_IA32_APICBASE)
Merging percpu/for-next (87d6aab2389e Merge tag 'for_linus' of git://git.ke=
rnel.org/pub/scm/linux/kernel/git/mst/vhost)
Merging workqueues/for-next (581434654e01 workqueue: Adjust WQ_MAX_ACTIVE f=
rom 512 to 2048)
Merging sched-ext/for-next (955bd1de213e Merge branch 'for-6.12-fixes' into=
 for-next)
Merging drivers-x86/for-next (31440fe70167 platform/x86/intel/pmt: Correct =
the typo 'ACCCESS_LOCAL')
Merging chrome-platform/for-next (7cbf28998d73 platform/chrome: Drop explic=
it initialization of struct i2c_device_id::driver_data to 0)
Merging chrome-platform-firmware/for-firmware-next (67f488dff17e firmware: =
coreboot: Don't register a pdev if screen_info data is present)
Merging hsi/for-next (c3eddf5e8c30 HSI: omap-ssi: Remove unnecessary debugf=
s_create_dir() error check)
Merging leds-lj/for-leds-next (9852d85ec9d4 Linux 6.12-rc1)
Merging ipmi/for-next (11a299a7933e Merge tag 'for-6.12/block-20240925' of =
git://git.kernel.dk/linux)
Merging driver-core/driver-core-next (9852d85ec9d4 Linux 6.12-rc1)
Merging usb/usb-next (4a9fe2a8ac53 dt-bindings: usb: dwc3-imx8mp: add compa=
tible string for imx95)
Merging thunderbolt/next (8cf0b93919e1 Linux 6.12-rc2)
Merging usb-serial/usb-next (9852d85ec9d4 Linux 6.12-rc1)
Merging tty/tty-next (8cf0b93919e1 Linux 6.12-rc2)
Merging char-misc/char-misc-next (8cf0b93919e1 Linux 6.12-rc2)
Merging accel/habanalabs-next (f03eee5fc922 Merge tag 'drm-xe-next-fixes-20=
24-05-02' of https://gitlab.freedesktop.org/drm/xe/kernel into drm-next)
Merging coresight/next (988d40a4d4e7 coresight: Make trace ID map spinlock =
local to the map)
Merging fastrpc/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging fpga/for-next (8de36789bd03 fpga: zynq-fpga: Rename 'timeout' varia=
ble as 'time_left')
Merging icc/icc-next (a5733950fe35 Merge branch 'icc-sm8350' into icc-next)
Merging iio/togreg (f3838e934dff iio: adc: ad7606: add support for AD7606C-=
{16,18} parts)
Applying: fix up for "iio: proximity: vl53l0x-i2c: Added continuous mode su=
pport"
Merging phy-next/next (bbcc9e2bde69 dt-bindings: phy: cadence-sierra: Allow=
 PHY types QSGMII and SGMII)
Merging soundwire/next (71b405b18444 soundwire: mipi-disco: add support for=
 DP0/DPn 'lane-list' property)
Merging extcon/extcon-next (9852d85ec9d4 Linux 6.12-rc1)
Merging gnss/gnss-next (9852d85ec9d4 Linux 6.12-rc1)
Merging vfio/next (aab439ffa1ca vfio/pci: clean up a type in vfio_pci_ioctl=
_pci_hot_reset_groups())
Merging w1/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging spmi/spmi-next (9852d85ec9d4 Linux 6.12-rc1)
Merging staging/staging-next (8cf0b93919e1 Linux 6.12-rc2)
Merging counter-next/counter-next (a3911e087d62 counter: ftm-quaddec: Enabl=
e module autoloading)
Merging siox/siox/for-next (db418d5f1ca5 siox: bus-gpio: Simplify using dev=
m_siox_* functions)
Merging mux/for-next (5be63fc19fca Linux 6.11-rc5)
Merging dmaengine/next (9852d85ec9d4 Linux 6.12-rc1)
Merging cgroup/for-next (e53dd32b55e4 Merge branch 'for-6.13' into for-next)
Merging scsi/for-next (d539a871ae47 scsi: scsi_transport_fc: Allow setting =
rport state to current state)
Merging scsi-mkp/for-next (94c4c5d78b0f scsi: ufs: ufs-qcom: Add fixup_dev_=
quirks vops)
Merging vhost/linux-next (221af82f606d vhost/scsi: null-ptr-dereference in =
vhost_scsi_get_req())
Merging rpmsg/for-next (8a8622b7c206 remoteproc: Use iommu_paging_domain_al=
loc())
Merging gpio/for-next (0bb80ecc33a8 Linux 6.6-rc1)
Merging gpio-brgl/gpio/for-next (b7adfb6076ff gpio: cdev: update flags at o=
nce when reconfiguring from user-space)
Merging gpio-intel/for-next (12b0e305f509 gpio: acpi: switch to device_for_=
each_child_node_scoped())
Merging pinctrl/for-next (8498e6b2b852 Merge branch 'devel' into for-next)
$ git reset --hard HEAD^
Merging next-20241004 version of pinctrl
Merging pinctrl-intel/for-next (37756257093b pinctrl: intel: platform: Add =
Panther Lake to the list of supported)
Merging pinctrl-renesas/renesas-pinctrl (7c980a8e4426 pinctrl: renesas: rzg=
2l: Add support for configuring schmitt-trigger)
Merging pinctrl-samsung/for-next (eed2e79221e2 pinctrl: samsung: Add exynos=
8895 SoC pinctrl configuration)
Merging pwm/pwm/for-next (abe9db96e852 Merge branch 'pwm/duty_offset')
Merging ktest/for-next (2351e8c65404 ktest.pl: Avoid false positives with g=
rub2 skip regex)
Merging kselftest/next (edd435390c55 docs: dev-tools: Add documentation for=
 the device focused kselftests)
Merging kunit/test (9852d85ec9d4 Linux 6.12-rc1)
Merging kunit-next/kunit (26ce90094958 list: test: Mending tests for list_c=
ut_position())
CONFLICT (content): Merge conflict in lib/Kconfig.debug
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
Merging slimbus/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging nvmem/for-next (3e93f43ae64b nvmem: Correct some typos in comments)
Merging xarray/main (6684aba0780d XArray: Add extra debugging check to xas_=
lock and friends)
Merging hyperv/hyperv-next (94e86b174d10 tools/hv: Add memory allocation ch=
eck in hv_fcopy_start)
Merging auxdisplay/for-next (0b028ff7e70e auxdisplay: Remove unused functio=
ns)
Merging kgdb/kgdb/for-next (9bccbe7b2087 kdb: Get rid of redundant kdb_curr=
_task())
Merging hmm/hmm (8cf0b93919e1 Linux 6.12-rc2)
Merging cfi/cfi/next (9852d85ec9d4 Linux 6.12-rc1)
Merging mhi/mhi-next (6d61859bbe76 bus: mhi: host: pci_generic: Use pcim_io=
map_region() to request and map MHI BAR)
Merging memblock/for-next (cb088e38aab4 s390/mm: get estimated free pages b=
y memblock api)
Merging cxl/next (2c70677dabb5 cxl: Add documentation to explain the shared=
 link bandwidth calculation)
Merging zstd/zstd-next (3f832dfb8a8e zstd: fix g_debuglevel export warning)
Merging efi/next (04736f7d1945 efi: Remove redundant null pointer checks in=
 efi_debugfs_init())
Merging unicode/for-next (66715f005bde unicode: change the reference of dat=
abase file)
Merging slab/slab/for-next (04e2c15fec21 Merge branch 'slab/for-6.13/featur=
es' into slab/for-next)
Merging random/master (d18c13697b4d prandom: Include <linux/percpu.h> in <l=
inux/prandom.h>)
Applying: fix up for "random: Do not include <linux/prandom.h> in <linux/ra=
ndom.h>"
Merging landlock/next (7cc2f07b4cab landlock: Improve documentation of prev=
ious limitations)
Merging rust/rust-next (c9b5ce6a7196 rust: error: optimize error type to us=
e nonzero)
CONFLICT (content): Merge conflict in rust/kernel/types.rs
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
Merging iommufd/for-next (e2d8fe9148b7 Documentation: userspace-api: iommuf=
d: Update HWPT_PAGING and HWPT_NESTED)
Merging turbostat/next (a119348cb685 tools/power turbostat: Honor --show CP=
U, even when even when num_cpus=3D1)
Merging pwrseq/pwrseq/for-next (9852d85ec9d4 Linux 6.12-rc1)
Merging capabilities-next/caps-next (de2433c608c2 capabilities: remove cap_=
mmap_file())
Merging ipe/next (b51a254cebc9 ipe: fallback to platform keyring also if ke=
y in trusted keyring is rejected)
Merging header_cleanup/header_cleanup (5f4c01f1e3c7 spinlock: Fix failing b=
uild for PREEMPT_RT)

--Sig_/Xo2zKQ64RJLju4fabaF4n6C
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmcGLrAACgkQAVBC80lX
0Gwaewf+KMffcltiwa5cD49s8YPI8omZfromJKuA2YfCg8ITU1mOBTgCxAf8FReK
hEVaU9/QcQrMbHef+W/r3t6FjJG2rCiTTbpXo8dSwW3Ekal7jVYaDTgBoN/AKj7R
kq14sLYw3r4I/pG0PiSfrXdq/eZTyJS/2Y5g033SwYAG4X8oJ+d96OWjnjEAITFU
w0BB9R5jcOS9skvt8v8/pqujO68IEdAo63Y8VC6t4bIqRygWAqHCUyCis76cOn82
Pt1dqalkRwHnpgjA0cMMX/Dua/QgBIEL/zrsnWmvnWL7XmGB5sBqWnZub2YhIvok
P5GVG0gmkM4jxhA/GKaN1C4ySul9JQ==
=JZys
-----END PGP SIGNATURE-----

--Sig_/Xo2zKQ64RJLju4fabaF4n6C--

