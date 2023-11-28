Return-Path: <linux-next+bounces-106-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5405F7FC7FA
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 22:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E5AA283133
	for <lists+linux-next@lfdr.de>; Tue, 28 Nov 2023 21:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B0244395;
	Tue, 28 Nov 2023 21:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBQZ66Am"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1762044386
	for <linux-next@vger.kernel.org>; Tue, 28 Nov 2023 21:33:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E63C433C7;
	Tue, 28 Nov 2023 21:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701207226;
	bh=0y0x3HeNVaPz4M/ZlU2XszvPzKuo0CxoGX3FIFfMi8A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XBQZ66AmVpr8uvTcU1bD28+iYbg3ktmiGd87sNJMM9JdcHsAYoyYr2iXJ+LuKFH/0
	 wyWSfEL0qR3h/Jhuub4iMGXY07SHCVUCdW4B1wLkkv6FdAbvd1Ocl08eWIur6Ua2CZ
	 5xLZlTByC6iCTVgGdFVElS3zDx+Dm3u5Z3SfWQiY4OhPz+I+M11Fn5fbIpLVm4wzEn
	 nvg2IY8KCEO+IG0ON9JNergQfb5kpcC9WP3D8Ht356FFI5xKhjt5H/RceXuyN/j59t
	 nUh2WLBmjXlw1pJNJHKPG4GhIDp+Vi3lzxy+/0UzY8HYVIxaR9wWlXFYcHcvvi/BiO
	 tv8+IP0l/60Og==
Date: Tue, 28 Nov 2023 14:33:44 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.cz>,
	David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
	Josef Bacik <josef@toxicpanda.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the vfs-brauner tree with the btrfs
 tree
Message-ID: <20231128213344.GA3423530@dev-arch.thelio-3990X>
References: <20231127092001.54a021e8@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127092001.54a021e8@canb.auug.org.au>

Hi Stephen (and other maintainers),

On Mon, Nov 27, 2023 at 09:20:01AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the vfs-brauner tree got a conflict in:
> 
>   fs/btrfs/super.c
> 
> between commit:
> 
>   2f2cfead5107 ("btrfs: remove old mount API code")
> 
> from the btrfs tree and commit:
> 
>   ead622674df5 ("btrfs: Do not restrict writes to btrfs devices")
> 
> from the vfs-brauner tree.
> 
> I fixed it up (the former removed the funtion updated by the latter, but
> a further fix may be required to implement the intent of the latter?)

Yes, the lack of ead622674df5 appears to cause issues with mounting
btrfs volumes on at least next-20231128 due to the presence of commit
6f861765464f ("fs: Block writes to mounted block devices"). In QEMU, I
can see:

  :: running early hook [udev]
  Warning: /lib/modules/6.7.0-rc3-next-20231128/modules.devname not found - ignoring
  Starting systemd-udevd version 252.5-1-arch
  :: running hook [udev]
  :: Triggering uevents...
  :: running hook [keymap]
  :: Loading keymap...kbd_mode: KDSKBMODE: Inappropriate ioctl for device
  done.
  :: performing fsck on '/dev/vda2'
  :: mounting '/dev/vda2' on real root
  mount: /new_root: wrong fs type, bad option, bad superblock on /dev/vda2, missing codepage or helper program, or other error.
         dmesg(1) may have more information after failed mount system call.
  You are now being dropped into an emergency shell.
  sh: can't access tty; job control turned off
  [rootfs ]#

The following diff allows my VM to boot properly but I am not sure if
there is a better or more proper fix (I am already out of my element
heh). If a proper merge solution cannot be found quickly, can
6f861765464f be reverted in the meantime so that all my machines with
btrfs can boot properly? :)

Cheers,
Nathan

diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index 99d10a25a579..23db0306b8ef 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -299,6 +299,7 @@ static int btrfs_parse_param(struct fs_context *fc,
 	case Opt_device: {
 		struct btrfs_device *device;
 		blk_mode_t mode = sb_open_mode(fc->sb_flags);
+		mode &= ~BLK_OPEN_RESTRICT_WRITES;
 
 		mutex_lock(&uuid_mutex);
 		device = btrfs_scan_one_device(param->string, mode, false);
@@ -1801,6 +1802,8 @@ static int btrfs_get_tree_super(struct fs_context *fc)
 	blk_mode_t mode = sb_open_mode(fc->sb_flags);
 	int ret;
 
+	mode &= ~BLK_OPEN_RESTRICT_WRITES;
+
 	btrfs_ctx_to_info(fs_info, ctx);
 	mutex_lock(&uuid_mutex);
 

