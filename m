Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 920C8217C80
	for <lists+linux-next@lfdr.de>; Wed,  8 Jul 2020 03:20:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728819AbgGHBUK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 7 Jul 2020 21:20:10 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:39683 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728589AbgGHBUK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Tue, 7 Jul 2020 21:20:10 -0400
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1hLW29nyz9sQt;
        Wed,  8 Jul 2020 11:20:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
        s=201702; t=1594171205;
        bh=1SRs0qM/XCA9VtNC+LXwvIDQOGghg+mZ1IRULHhvWZ0=;
        h=Date:From:To:Cc:Subject:From;
        b=k74T35OZkD2JdCEtInGOkU88Fll1h9wS2bGhSdAnYUzzPfgrjEqnhNym6AQHnQXPa
         X2cUcEaizIQpu+r/HeKWue0iyHkE79gSBme1fUhDKFNfnOTgV0yy3lSGouTFVyClPY
         8aSKerozBBsQ4mcIrR7wBeenCz9Kx//vF+VqPdhlh87Ac0Ap4uyNSojTlIBmwRfTPe
         NiSs/aqEnwevUgISJV6LPNauraXDIQdn3ByWA9C8VapCB4v+G0eNGBz8qBdQ6NXynB
         +PhNCZOzoG+YeJw6lxR/VXnAUhvxHRZsaBD0WDodKMPHaTTP7gQ7sGTN6anh4/ABaH
         Wvb7EFUt8mGyg==
Date:   Wed, 8 Jul 2020 11:20:02 +1000
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Jonathan Corbet <corbet@lwn.net>, Theodore Ts'o <tytso@mit.edu>,
        Eric Biggers <ebiggers@kernel.org>,
        Jaegeuk Kim <jaegeuk@kernel.org>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Chao Yu <yuchao0@huawei.com>,
        Satya Tangirala <satyat@google.com>
Subject: linux-next: manual merge of the jc_docs tree with the fscrypt and
 f2fs trees
Message-ID: <20200708112002.26a87970@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/OUgRDeQ9kLxtghygOoSqwd5";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

--Sig_/OUgRDeQ9kLxtghygOoSqwd5
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the jc_docs tree got a conflict in:

  Documentation/filesystems/f2fs.rst

between commits:

  38dff4e50c12 ("f2fs: add inline encryption support")
  a7c77c387b60 ("f2fs: fix to document reserved special compression extensi=
on")

from the fscrypt and f2fs trees and commit:

  9aa1ccb4e588 ("docs: f2fs: fix a broken table")

from the jc_docs tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc Documentation/filesystems/f2fs.rst
index 7b2649ee2ad7,1e7dade24a19..000000000000
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@@ -101,173 -101,164 +101,173 @@@ Mount Option
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =20
 =20
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
- background_gc=3D%s       Turn on/off cleaning operations, namely garbage
-                        collection, triggered in background when I/O subsy=
stem is
-                        idle. If background_gc=3Don, it will turn on the g=
arbage
-                        collection and if background_gc=3Doff, garbage col=
lection
-                        will be turned off. If background_gc=3Dsync, it wi=
ll turn
-                        on synchronous garbage collection running in backg=
round.
-                        Default value for this option is on. So garbage
-                        collection is on by default.
- disable_roll_forward   Disable the roll-forward recovery routine
- norecovery             Disable the roll-forward recovery routine, mounted=
 read-
-                        only (i.e., -o ro,disable_roll_forward)
- discard/nodiscard      Enable/disable real-time discard in f2fs, if disca=
rd is
-                        enabled, f2fs will issue discard/TRIM commands whe=
n a
- 		       segment is cleaned.
- no_heap                Disable heap-style segment allocation which finds =
free
-                        segments for data from the beginning of main area,=
 while
- 		       for node from the end of main area.
- nouser_xattr           Disable Extended User Attributes. Note: xattr is e=
nabled
-                        by default if CONFIG_F2FS_FS_XATTR is selected.
- noacl                  Disable POSIX Access Control List. Note: acl is en=
abled
-                        by default if CONFIG_F2FS_FS_POSIX_ACL is selected.
- active_logs=3D%u         Support configuring the number of active logs. I=
n the
-                        current design, f2fs supports only 2, 4, and 6 log=
s.
-                        Default number is 6.
- disable_ext_identify   Disable the extension list configured by mkfs, so =
f2fs
-                        does not aware of cold files such as media files.
- inline_xattr           Enable the inline xattrs feature.
- noinline_xattr         Disable the inline xattrs feature.
- inline_xattr_size=3D%u   Support configuring inline xattr size, it depend=
s on
- 		       flexible inline xattr feature.
- inline_data            Enable the inline data feature: New created small(=
<~3.4k)
-                        files can be written into inode block.
- inline_dentry          Enable the inline dir feature: data in new created
-                        directory entries can be written into inode block.=
 The
-                        space of inode block which is used to store inline
-                        dentries is limited to ~3.4k.
- noinline_dentry        Disable the inline dentry feature.
- flush_merge	       Merge concurrent cache_flush commands as much as possi=
ble
-                        to eliminate redundant command issues. If the unde=
rlying
- 		       device handles the cache_flush command relatively slowly,
- 		       recommend to enable this option.
- nobarrier              This option can be used if underlying storage guar=
antees
-                        its cached data should be written to the novolatil=
e area.
- 		       If this option is set, no cache_flush commands are issued
- 		       but f2fs still guarantees the write ordering of all the
- 		       data writes.
- fastboot               This option is used when a system wants to reduce =
mount
-                        time as much as possible, even though normal perfo=
rmance
- 		       can be sacrificed.
- extent_cache           Enable an extent cache based on rb-tree, it can ca=
che
-                        as many as extent which map between contiguous log=
ical
-                        address and physical address per inode, resulting =
in
-                        increasing the cache hit ratio. Set by default.
- noextent_cache         Disable an extent cache based on rb-tree explicitl=
y, see
-                        the above extent_cache mount option.
- noinline_data          Disable the inline data feature, inline data featu=
re is
-                        enabled by default.
- data_flush             Enable data flushing before checkpoint in order to
-                        persist data of regular and symlink.
- reserve_root=3D%d        Support configuring reserved space which is used=
 for
-                        allocation from a privileged user with specified u=
id or
-                        gid, unit: 4KB, the default limit is 0.2% of user =
blocks.
- resuid=3D%d              The user ID which may use the reserved blocks.
- resgid=3D%d              The group ID which may use the reserved blocks.
- fault_injection=3D%d     Enable fault injection in all supported types wi=
th
-                        specified injection rate.
- fault_type=3D%d          Support configuring fault injection type, should=
 be
-                        enabled with fault_injection option, fault type va=
lue
-                        is shown below, it supports single or combined typ=
e.
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+ background_gc=3D%s	 Turn on/off cleaning operations, namely garbage
+ 			 collection, triggered in background when I/O subsystem is
+ 			 idle. If background_gc=3Don, it will turn on the garbage
+ 			 collection and if background_gc=3Doff, garbage collection
+ 			 will be turned off. If background_gc=3Dsync, it will turn
+ 			 on synchronous garbage collection running in background.
+ 			 Default value for this option is on. So garbage
+ 			 collection is on by default.
+ disable_roll_forward	 Disable the roll-forward recovery routine
+ norecovery		 Disable the roll-forward recovery routine, mounted read-
+ 			 only (i.e., -o ro,disable_roll_forward)
+ discard/nodiscard	 Enable/disable real-time discard in f2fs, if discard is
+ 			 enabled, f2fs will issue discard/TRIM commands when a
+ 			 segment is cleaned.
+ no_heap			 Disable heap-style segment allocation which finds free
+ 			 segments for data from the beginning of main area, while
+ 			 for node from the end of main area.
+ nouser_xattr		 Disable Extended User Attributes. Note: xattr is enabled
+ 			 by default if CONFIG_F2FS_FS_XATTR is selected.
+ noacl			 Disable POSIX Access Control List. Note: acl is enabled
+ 			 by default if CONFIG_F2FS_FS_POSIX_ACL is selected.
+ active_logs=3D%u		 Support configuring the number of active logs. In the
+ 			 current design, f2fs supports only 2, 4, and 6 logs.
+ 			 Default number is 6.
+ disable_ext_identify	 Disable the extension list configured by mkfs, so f=
2fs
+ 			 does not aware of cold files such as media files.
+ inline_xattr		 Enable the inline xattrs feature.
+ noinline_xattr		 Disable the inline xattrs feature.
+ inline_xattr_size=3D%u	 Support configuring inline xattr size, it depends=
 on
+ 			 flexible inline xattr feature.
+ inline_data		 Enable the inline data feature: New created small(<~3.4k)
+ 			 files can be written into inode block.
+ inline_dentry		 Enable the inline dir feature: data in new created
+ 			 directory entries can be written into inode block. The
+ 			 space of inode block which is used to store inline
+ 			 dentries is limited to ~3.4k.
+ noinline_dentry		 Disable the inline dentry feature.
+ flush_merge		 Merge concurrent cache_flush commands as much as possible
+ 			 to eliminate redundant command issues. If the underlying
+ 			 device handles the cache_flush command relatively slowly,
+ 			 recommend to enable this option.
+ nobarrier		 This option can be used if underlying storage guarantees
+ 			 its cached data should be written to the novolatile area.
+ 			 If this option is set, no cache_flush commands are issued
+ 			 but f2fs still guarantees the write ordering of all the
+ 			 data writes.
+ fastboot		 This option is used when a system wants to reduce mount
+ 			 time as much as possible, even though normal performance
+ 			 can be sacrificed.
+ extent_cache		 Enable an extent cache based on rb-tree, it can cache
+ 			 as many as extent which map between contiguous logical
+ 			 address and physical address per inode, resulting in
+ 			 increasing the cache hit ratio. Set by default.
+ noextent_cache		 Disable an extent cache based on rb-tree explicitly, see
+ 			 the above extent_cache mount option.
+ noinline_data		 Disable the inline data feature, inline data feature is
+ 			 enabled by default.
+ data_flush		 Enable data flushing before checkpoint in order to
+ 			 persist data of regular and symlink.
+ reserve_root=3D%d		 Support configuring reserved space which is used for
+ 			 allocation from a privileged user with specified uid or
+ 			 gid, unit: 4KB, the default limit is 0.2% of user blocks.
+ resuid=3D%d		 The user ID which may use the reserved blocks.
+ resgid=3D%d		 The group ID which may use the reserved blocks.
+ fault_injection=3D%d	 Enable fault injection in all supported types with
+ 			 specified injection rate.
+ fault_type=3D%d		 Support configuring fault injection type, should be
+ 			 enabled with fault_injection option, fault type value
+ 			 is shown below, it supports single or combined type.
 =20
-                        =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-                        Type_Name		Type_Value
-                        =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
-                        FAULT_KMALLOC		0x000000001
-                        FAULT_KVMALLOC		0x000000002
-                        FAULT_PAGE_ALLOC		0x000000004
-                        FAULT_PAGE_GET		0x000000008
-                        FAULT_ALLOC_BIO		0x000000010
-                        FAULT_ALLOC_NID		0x000000020
-                        FAULT_ORPHAN		0x000000040
-                        FAULT_BLOCK		0x000000080
-                        FAULT_DIR_DEPTH		0x000000100
-                        FAULT_EVICT_INODE	0x000000200
-                        FAULT_TRUNCATE		0x000000400
-                        FAULT_READ_IO		0x000000800
-                        FAULT_CHECKPOINT		0x000001000
-                        FAULT_DISCARD		0x000002000
-                        FAULT_WRITE_IO		0x000004000
-                        =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D	=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- mode=3D%s                Control block allocation mode which supports "ad=
aptive"
-                        and "lfs". In "lfs" mode, there should be no random
-                        writes towards main area.
- io_bits=3D%u             Set the bit size of write IO requests. It should=
 be set
-                        with "mode=3Dlfs".
- usrquota               Enable plain user disk quota accounting.
- grpquota               Enable plain group disk quota accounting.
- prjquota               Enable plain project quota accounting.
- usrjquota=3D<file>       Appoint specified file and type during mount, so=
 that quota
- grpjquota=3D<file>       information can be properly updated during recov=
ery flow,
- prjjquota=3D<file>       <quota file>: must be in root directory;
- jqfmt=3D<quota type>     <quota type>: [vfsold,vfsv0,vfsv1].
- offusrjquota           Turn off user journelled quota.
- offgrpjquota           Turn off group journelled quota.
- offprjjquota           Turn off project journelled quota.
- quota                  Enable plain user disk quota accounting.
- noquota                Disable all plain disk quota option.
- whint_mode=3D%s          Control which write hints are passed down to blo=
ck
-                        layer. This supports "off", "user-based", and
-                        "fs-based".  In "off" mode (default), f2fs does no=
t pass
-                        down hints. In "user-based" mode, f2fs tries to pa=
ss
-                        down hints given by users. And in "fs-based" mode,=
 f2fs
-                        passes down hints with its policy.
- alloc_mode=3D%s          Adjust block allocation policy, which supports "=
reuse"
-                        and "default".
- fsync_mode=3D%s          Control the policy of fsync. Currently supports =
"posix",
-                        "strict", and "nobarrier". In "posix" mode, which =
is
-                        default, fsync will follow POSIX semantics and doe=
s a
-                        light operation to improve the filesystem performa=
nce.
-                        In "strict" mode, fsync will be heavy and behaves =
in line
-                        with xfs, ext4 and btrfs, where xfstest generic/34=
2 will
-                        pass, but the performance will regress. "nobarrier=
" is
-                        based on "posix", but doesn't issue flush command =
for
-                        non-atomic files likewise "nobarrier" mount option.
+ 			 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	  =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+ 			 Type_Name		  Type_Value
+ 			 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	  =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+ 			 FAULT_KMALLOC		  0x000000001
+ 			 FAULT_KVMALLOC		  0x000000002
+ 			 FAULT_PAGE_ALLOC	  0x000000004
+ 			 FAULT_PAGE_GET		  0x000000008
+ 			 FAULT_ALLOC_BIO	  0x000000010
+ 			 FAULT_ALLOC_NID	  0x000000020
+ 			 FAULT_ORPHAN		  0x000000040
+ 			 FAULT_BLOCK		  0x000000080
+ 			 FAULT_DIR_DEPTH	  0x000000100
+ 			 FAULT_EVICT_INODE	  0x000000200
+ 			 FAULT_TRUNCATE		  0x000000400
+ 			 FAULT_READ_IO		  0x000000800
+ 			 FAULT_CHECKPOINT	  0x000001000
+ 			 FAULT_DISCARD		  0x000002000
+ 			 FAULT_WRITE_IO		  0x000004000
+ 			 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D	  =3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
+ mode=3D%s			 Control block allocation mode which supports "adaptive"
+ 			 and "lfs". In "lfs" mode, there should be no random
+ 			 writes towards main area.
+ io_bits=3D%u		 Set the bit size of write IO requests. It should be set
+ 			 with "mode=3Dlfs".
+ usrquota		 Enable plain user disk quota accounting.
+ grpquota		 Enable plain group disk quota accounting.
+ prjquota		 Enable plain project quota accounting.
+ usrjquota=3D<file>	 Appoint specified file and type during mount, so that=
 quota
+ grpjquota=3D<file>	 information can be properly updated during recovery f=
low,
+ prjjquota=3D<file>	 <quota file>: must be in root directory;
+ jqfmt=3D<quota type>	 <quota type>: [vfsold,vfsv0,vfsv1].
+ offusrjquota		 Turn off user journelled quota.
+ offgrpjquota		 Turn off group journelled quota.
+ offprjjquota		 Turn off project journelled quota.
+ quota			 Enable plain user disk quota accounting.
+ noquota			 Disable all plain disk quota option.
+ whint_mode=3D%s		 Control which write hints are passed down to block
+ 			 layer. This supports "off", "user-based", and
+ 			 "fs-based".  In "off" mode (default), f2fs does not pass
+ 			 down hints. In "user-based" mode, f2fs tries to pass
+ 			 down hints given by users. And in "fs-based" mode, f2fs
+ 			 passes down hints with its policy.
+ alloc_mode=3D%s		 Adjust block allocation policy, which supports "reuse"
+ 			 and "default".
+ fsync_mode=3D%s		 Control the policy of fsync. Currently supports "posix",
+ 			 "strict", and "nobarrier". In "posix" mode, which is
+ 			 default, fsync will follow POSIX semantics and does a
+ 			 light operation to improve the filesystem performance.
+ 			 In "strict" mode, fsync will be heavy and behaves in line
+ 			 with xfs, ext4 and btrfs, where xfstest generic/342 will
+ 			 pass, but the performance will regress. "nobarrier" is
+ 			 based on "posix", but doesn't issue flush command for
+ 			 non-atomic files likewise "nobarrier" mount option.
  test_dummy_encryption
  test_dummy_encryption=3D%s
-                        Enable dummy encryption, which provides a fake fsc=
rypt
-                        context. The fake fscrypt context is used by xfste=
sts.
-                        The argument may be either "v1" or "v2", in order =
to
-                        select the corresponding fscrypt policy version.
- checkpoint=3D%s[:%u[%]]  Set to "disable" to turn off checkpointing. Set =
to "enable"
-                        to reenable checkpointing. Is enabled by default. =
While
-                        disabled, any unmounting or unexpected shutdowns w=
ill cause
-                        the filesystem contents to appear as they did when=
 the
-                        filesystem was mounted with that option.
-                        While mounting with checkpoint=3Ddisabled, the fil=
esystem must
-                        run garbage collection to ensure that all availabl=
e space can
-                        be used. If this takes too much time, the mount ma=
y return
-                        EAGAIN. You may optionally add a value to indicate=
 how much
-                        of the disk you would be willing to temporarily gi=
ve up to
-                        avoid additional garbage collection. This can be g=
iven as a
-                        number of blocks, or as a percent. For instance, m=
ounting
-                        with checkpoint=3Ddisable:100% would always succee=
d, but it may
-                        hide up to all remaining free space. The actual sp=
ace that
-                        would be unusable can be viewed at /sys/fs/f2fs/<d=
isk>/unusable
-                        This space is reclaimed once checkpoint=3Denable.
- compress_algorithm=3D%s  Control compress algorithm, currently f2fs suppo=
rts "lzo",
-                        "lz4", "zstd" and "lzo-rle" algorithm.
- compress_log_size=3D%u   Support configuring compress cluster size, the s=
ize will
-                        be 4KB * (1 << %u), 16KB is minimum size, also it's
-                        default size.
- compress_extension=3D%s  Support adding specified extension, so that f2fs=
 can enable
-                        compression on those corresponding files, e.g. if =
all files
-                        with '.ext' has high compression rate, we can set =
the '.ext'
-                        on compression extension list and enable compressi=
on on
-                        these file by default rather than to enable it via=
 ioctl.
-                        For other files, we can still enable compression v=
ia ioctl.
-                        Note that, there is one reserved special extension=
 '*', it
-                        can be set to enable compression for all files.
+ 			 Enable dummy encryption, which provides a fake fscrypt
+ 			 context. The fake fscrypt context is used by xfstests.
+ 			 The argument may be either "v1" or "v2", in order to
+ 			 select the corresponding fscrypt policy version.
+ checkpoint=3D%s[:%u[%]]	 Set to "disable" to turn off checkpointing. Set =
to "enable"
+ 			 to reenable checkpointing. Is enabled by default. While
+ 			 disabled, any unmounting or unexpected shutdowns will cause
+ 			 the filesystem contents to appear as they did when the
+ 			 filesystem was mounted with that option.
+ 			 While mounting with checkpoint=3Ddisabled, the filesystem must
+ 			 run garbage collection to ensure that all available space can
+ 			 be used. If this takes too much time, the mount may return
+ 			 EAGAIN. You may optionally add a value to indicate how much
+ 			 of the disk you would be willing to temporarily give up to
+ 			 avoid additional garbage collection. This can be given as a
+ 			 number of blocks, or as a percent. For instance, mounting
+ 			 with checkpoint=3Ddisable:100% would always succeed, but it may
+ 			 hide up to all remaining free space. The actual space that
+ 			 would be unusable can be viewed at /sys/fs/f2fs/<disk>/unusable
+ 			 This space is reclaimed once checkpoint=3Denable.
+ compress_algorithm=3D%s	 Control compress algorithm, currently f2fs suppo=
rts "lzo",
+ 			 "lz4", "zstd" and "lzo-rle" algorithm.
+ compress_log_size=3D%u	 Support configuring compress cluster size, the si=
ze will
+ 			 be 4KB * (1 << %u), 16KB is minimum size, also it's
+ 			 default size.
+ compress_extension=3D%s	 Support adding specified extension, so that f2fs=
 can enable
+ 			 compression on those corresponding files, e.g. if all files
+ 			 with '.ext' has high compression rate, we can set the '.ext'
+ 			 on compression extension list and enable compression on
+ 			 these file by default rather than to enable it via ioctl.
+ 			 For other files, we can still enable compression via ioctl.
++			 Note that, there is one reserved special extension '*', it
++			 can be set to enable compression for all files.
 +inlinecrypt
-                        When possible, encrypt/decrypt the contents of enc=
rypted
-                        files using the blk-crypto framework rather than
-                        filesystem-layer encryption. This allows the use of
-                        inline encryption hardware. The on-disk format is
-                        unaffected. For more details, see
-                        Documentation/block/inline-encryption.rst.
- =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D
++			 When possible, encrypt/decrypt the contents of encrypted
++			 files using the blk-crypto framework rather than
++			 filesystem-layer encryption. This allows the use of
++			 inline encryption hardware. The on-disk format is
++			 unaffected. For more details, see
++			 Documentation/block/inline-encryption.rst.
+ =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
 =20
  Debugfs Entries
  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

--Sig_/OUgRDeQ9kLxtghygOoSqwd5
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8FH0IACgkQAVBC80lX
0Gznfgf+PtY97YBK2z7iP9PDsnGIG6k1l8eLd2nleyJmLBwBZw4K62WqK1AUFe13
n6P8npCT/nveUvvf3+XVO0wyeFEzV45eTArYJBDCxWMcqtCJp478kPZS3z9YUYHe
84j9dDqMdECZI9I+lWXHxV2Enrr+/UB4aYJdYR3nQef1CPnuE7hxMZiUurovq96W
I3AEzxoZucWSjql7JiMD4hQc/6mzeyPC36wLHvG7+23X8DaQi96euMJxDA614Yfl
zSt6EGjIKOmb+hNNhR0U2tzOd3JqAUGy5Dfm734Ae3YJEWbrMIQYMeWpwW1pKdf6
kgGUVb3p374NvaId4FZZ4c+PMG6FtA==
=Igz8
-----END PGP SIGNATURE-----

--Sig_/OUgRDeQ9kLxtghygOoSqwd5--
