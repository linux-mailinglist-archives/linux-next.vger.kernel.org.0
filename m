Return-Path: <linux-next+bounces-7584-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D34B07709
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 15:31:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F0AF1C205CB
	for <lists+linux-next@lfdr.de>; Wed, 16 Jul 2025 13:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7CB35972;
	Wed, 16 Jul 2025 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="hPXCp2Nq"
X-Original-To: linux-next@vger.kernel.org
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B08219AD70;
	Wed, 16 Jul 2025 13:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752672688; cv=none; b=Bi5lWD8do3pC5ZJ9tIU19VBNH6TmvWLPnWiAJ4rHAEfceleM5RKj2RvtpNjWYbUjxorQg3khpep1Lmf0MOq48LwoXZ7M20x3uCp8z4k+cjnay7PqP2CLBpHgrGQtI50F10k9EjCyT5Bvx9lwvdUHvKKdOaK/AxSgx46mqXjAWV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752672688; c=relaxed/simple;
	bh=LJtChCkuv4oDN5YJQpsL32M5XLdNqX3Bk3qR0YQsneU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OzMazfb4ZxNiv2OZilhzzMfyzSbICYQkM8hFZ0sshwXxexqxTBtrmnF+VX2eQ0Sz1HfniemUHSw604WiXbZ+KfKmNOp1puVNbrNdb5z4i+XzKucw+Lw5o3ZkqpB45UqLaqiwrtL0ixX4FMOPAW9U1e/V4/yLQDySUw3hmAhsYnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=hPXCp2Nq; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 4195C403E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1752672686; bh=JnNzVzkbLFwfRckqtOoq/iYPAifrTSt+rYFPQy8Mans=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hPXCp2Nq2uOh6H9W5cwxhsUoVSnGGABcvW+01Qrzqldre5NmDjZP50m+2XSPg54Yn
	 c/zNH8cKJ2tY25j2Kyo08EZYwGUdnTNBC8Om9RqW6AvBBtBK2C12ur/SrY1z/bKmCK
	 c5sxf2WfYInTsdJP1hrTC/BskvjnMenLXJ3y0d24be5UHXRRjZio/w6tj6gRkBFSZv
	 hz4mjc93kGU8bdrFknVHkazQiGOz702M2pYguiCz13uKyPC05JnQU0G/+fDrYfYFw1
	 29ARLxvtEYQkFoF03Kz0VAGgP1sxx2TAF6Ci52nHlB+G76Ju58ORfzb3SWi1oHv0It
	 InQc+wvEBA8cw==
Received: from localhost (unknown [IPv6:2601:280:4600:2da9::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id 4195C403E1;
	Wed, 16 Jul 2025 13:31:26 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jens Axboe <axboe@kernel.dk>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the block tree with the jc_docs tree
In-Reply-To: <20250716150234.52ec0d5f@canb.auug.org.au>
References: <20250716150234.52ec0d5f@canb.auug.org.au>
Date: Wed, 16 Jul 2025 07:31:25 -0600
Message-ID: <87ecugdzyq.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> Today's linux-next merge of the block tree got a conflict in:
>
>   Documentation/userspace-api/ioctl/ioctl-number.rst
>
> between commit:
>
>   15afd5def819 ("Documentation: ioctl-number: Extend "Include File" column width")
>
> from the jc_docs tree and commit:
>
>   1cea5180f2f8 ("block: remove pktcdvd driver")
>
> from the block tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

That seems like an awful lot of fallout given that the block side, in
its entirety, just removes a single line.  I guess the resolution is
correct - thanks - but I don't quite understand why the conflict is so
widespread.

jon

> diff --cc Documentation/userspace-api/ioctl/ioctl-number.rst
> index 677456c31228,4f1532a251d2..000000000000
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@@ -223,32 -219,31 +223,31 @@@ Code  Seq#    Include Fil
>                fs/xfs/linux-2.6/xfs_ioctl32.h,
>                include/linux/falloc.h,
>                linux/fs.h,
>  -'X'   all    fs/ocfs2/ocfs_fs.h                                      conflict!
>  +'X'   all    fs/ocfs2/ocfs_fs.h                                        conflict!
> - 'X'   01     linux/pktcdvd.h                                           conflict!
>   'Z'   14-15  drivers/message/fusion/mptctl.h
>  -'['   00-3F  linux/usb/tmc.h                                         USB Test and Measurement Devices
>  -                                                                     <mailto:gregkh@linuxfoundation.org>
>  -'a'   all    linux/atm*.h, linux/sonet.h                             ATM on linux
>  -                                                                     <http://lrcwww.epfl.ch/>
>  -'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h          conflict! qat driver
>  -'b'   00-FF                                                          conflict! bit3 vme host bridge
>  -                                                                     <mailto:natalia@nikhefk.nikhef.nl>
>  -'b'   00-0F  linux/dma-buf.h                                         conflict!
>  -'c'   00-7F  linux/comstats.h                                        conflict!
>  -'c'   00-7F  linux/coda.h                                            conflict!
>  -'c'   00-1F  linux/chio.h                                            conflict!
>  -'c'   80-9F  arch/s390/include/asm/chsc.h                            conflict!
>  +'['   00-3F  linux/usb/tmc.h                                           USB Test and Measurement Devices
>  +                                                                       <mailto:gregkh@linuxfoundation.org>
>  +'a'   all    linux/atm*.h, linux/sonet.h                               ATM on linux
>  +                                                                       <http://lrcwww.epfl.ch/>
>  +'a'   00-0F  drivers/crypto/qat/qat_common/adf_cfg_common.h            conflict! qat driver
>  +'b'   00-FF                                                            conflict! bit3 vme host bridge
>  +                                                                       <mailto:natalia@nikhefk.nikhef.nl>
>  +'b'   00-0F  linux/dma-buf.h                                           conflict!
>  +'c'   00-7F  linux/comstats.h                                          conflict!
>  +'c'   00-7F  linux/coda.h                                              conflict!
>  +'c'   00-1F  linux/chio.h                                              conflict!
>  +'c'   80-9F  arch/s390/include/asm/chsc.h                              conflict!
>   'c'   A0-AF  arch/x86/include/asm/msr.h conflict!
>  -'d'   00-FF  linux/char/drm/drm.h                                    conflict!
>  -'d'   02-40  pcmcia/ds.h                                             conflict!
>  +'d'   00-FF  linux/char/drm/drm.h                                      conflict!
>  +'d'   02-40  pcmcia/ds.h                                               conflict!
>   'd'   F0-FF  linux/digi1.h
>  -'e'   all    linux/digi1.h                                           conflict!
>  -'f'   00-1F  linux/ext2_fs.h                                         conflict!
>  -'f'   00-1F  linux/ext3_fs.h                                         conflict!
>  -'f'   00-0F  fs/jfs/jfs_dinode.h                                     conflict!
>  -'f'   00-0F  fs/ext4/ext4.h                                          conflict!
>  -'f'   00-0F  linux/fs.h                                              conflict!
>  -'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                     conflict!
>  +'e'   all    linux/digi1.h                                             conflict!
>  +'f'   00-1F  linux/ext2_fs.h                                           conflict!
>  +'f'   00-1F  linux/ext3_fs.h                                           conflict!
>  +'f'   00-0F  fs/jfs/jfs_dinode.h                                       conflict!
>  +'f'   00-0F  fs/ext4/ext4.h                                            conflict!
>  +'f'   00-0F  linux/fs.h                                                conflict!
>  +'f'   00-0F  fs/ocfs2/ocfs2_fs.h                                       conflict!
>   'f'   13-27  linux/fscrypt.h
>   'f'   81-8F  linux/fsverity.h
>   'g'   00-0F  linux/usb/gadgetfs.h

