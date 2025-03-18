Return-Path: <linux-next+bounces-5861-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A759FA677B4
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 16:25:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4EB1617B57E
	for <lists+linux-next@lfdr.de>; Tue, 18 Mar 2025 15:25:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C4A20F066;
	Tue, 18 Mar 2025 15:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b="uHeN0teI"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9671320F061
	for <linux-next@vger.kernel.org>; Tue, 18 Mar 2025 15:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742311510; cv=none; b=WYdrh0FZuy3c9/7OtLMvoHYAcPoQxKpKfXXQYJYqIvTVHnHkQwFLuuVrUHwVEJ4quvPtpGEt0D1nH0d4cBLa+CN7GFTIltw3cJGICRmeyn9Wmpvm4Axai6i7OmCZvRBQrV/7PKOQBXlUbB5Ja/GCIjaClIgKKZT3bElnAYAqqUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742311510; c=relaxed/simple;
	bh=gg9eWXRf0QSIvFW8j2BLRd4qu0afVH6hood5n862QTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sRBqFfo1MswkoceIgxOz6aJb5Goh4iT9AnZsz6e0rmhbN9N0cY5ETcbAwtE18SJP2ZtRsMiwICxfp+tWMdgyHkW8FvYmxgfJ/kawUGVtmEUxmL0fWHvfR4abBhrOxWgq7F6pjsfqwT63Za2TZqMn0w/IfOykNN7Vo+cn53ssujM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com; spf=pass smtp.mailfrom=omnibond.com; dkim=pass (2048-bit key) header.d=omnibond-com.20230601.gappssmtp.com header.i=@omnibond-com.20230601.gappssmtp.com header.b=uHeN0teI; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=omnibond.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=omnibond.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22423adf751so100994065ad.2
        for <linux-next@vger.kernel.org>; Tue, 18 Mar 2025 08:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=omnibond-com.20230601.gappssmtp.com; s=20230601; t=1742311508; x=1742916308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/uyB6tr0Jci4VoVMKtWhkDfXKFhkPYq2fT4hVGN3rc=;
        b=uHeN0teIZfZssPOBd0xAaM7LDR3LhAAzAPhkzj7yR5qYBfmOkCXvWJdAqKBtzLov+F
         eCy8WLA+0cUJao1oedZp86Be2QlUiCdBiTgDGieitkwZxk0wJS5dIBq6P5aUDSCTDZ4F
         oabYlzXzCTeyHb/8HDL3pU/oAG5q/YvemQa3BERk1xzoxL6TxZ8pVqqhQlsOhh8hdpHs
         QxIDnQS2NcTlfciaHveaDmPMiTocpbruDuPtC/SwMOgjtPaWhPKvalXPMqK8WP/GIpMY
         Yd1BwC0QGC7hAx4KqiimsJZvA0M9wXr8idNREnPh4XXaFZ35smlQ8vsSVC83TQjPQtJU
         PJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311508; x=1742916308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/uyB6tr0Jci4VoVMKtWhkDfXKFhkPYq2fT4hVGN3rc=;
        b=r/NVAmYWbk5Q8oN0VgNSf6IletblLuNFMPRVtISqdWvLlYKNBJNn2jzXnSR8EOvbew
         gntxCE+OnixaD+82MH7gWmjyupNWoXBT9nNPnEdEckcTgTp7BpAI4+0GyNOnfc84eTAF
         +KJJMyMAP4O6B/3ueP6+5DWx7KkrVKbnPs3qy5x9/B1sJXpk/LReeLoGczbB6ZiYJQQ8
         G9Dw8KSMc+QOABHaQhDkrf2oVVwRqr555L4ps+5Fin91Ddv79qaRuPuE2pXcUEQ3zQ1I
         ccLNtM7Kx+5DaWJMoGpByIzVx7IVfSmqXGVutqU8GfE/A2p+JaSYAg95F34yq9kYJqUm
         M6iA==
X-Forwarded-Encrypted: i=1; AJvYcCVEyCiMN+kLECASWEN30mazw443qlwdVLnJVixuxB9oQp0ShyxTfVn/P6ya6XkEoKFSQMqMdxOGEj58@vger.kernel.org
X-Gm-Message-State: AOJu0Ywjwv0fMQwQIHz8kEXs3wh3wW6q1zDpphi6zkNb8kVndVH1rdIB
	ookl5xpXVIoYhmd8nkDwRDPd7oZYzzoRwtlwLkJnHbpxXOclGPHNiV6slRoK7A0xtxguYrMHwLN
	Afg3U7z41brzIHrmG++/igkjShApy7AB2AoP1
X-Gm-Gg: ASbGnctMaZwX8uZL+PBhQxhQskAOyGQhns5337zjxn7+mEDYDXxBeLLG1NhCQ3fqqoK
	JZPbbOgR7fWpWf848ebcj26mQgOztQa7iGK9B1ad97j3GXYuDPdDHf3jKc+xw+IZJ0sKhtjxNDq
	gVlmIkQJV9EhmBE3IYgS3tcaQ/nsqzHBDsaPcx7A==
X-Google-Smtp-Source: AGHT+IG00JMPu1DGO8+srJWzsNWnbHMlwlrPLuqvFNUYo4+Mbs6IQUh2po/+vcIiaHJBdv6OOCnmocNuu+XHO7/Kt5s=
X-Received: by 2002:a05:6a00:9a7:b0:730:927c:d451 with SMTP id
 d2e1a72fcca58-7372246dacbmr23678821b3a.20.1742311507812; Tue, 18 Mar 2025
 08:25:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250318101256.01afbb47@canb.auug.org.au>
In-Reply-To: <20250318101256.01afbb47@canb.auug.org.au>
From: Mike Marshall <hubcap@omnibond.com>
Date: Tue, 18 Mar 2025 11:24:56 -0400
X-Gm-Features: AQ5f1JpP-N7TrJ8T-KTozAiCA9X5hFTwApUXqUk7ri_JLAbHt6GNt-GMEvno2lc
Message-ID: <CAOg9mSTNLVWjqU4DnHFhBjAfJ7Do_Lfj1Oxe0cn55TBb-hYPwA@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the vfs-brauner tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, Mike Marshall <hubcap@omnibond.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen... is there something I should do differently? I might be
using an older
version of the patch, it was sent to me around three weeks ago.

>>Caused by commit
 >> 50fb0a7f43c0 ("orangefs: Move s_kmod_keyword_mask_map to
orangefs-debugfs.c")
>>merging badly with commit
 >> 063f8013373a ("orangefs: move s_kmod_keyword_mask_map[] into debugfs.c"=
)

One has "Move" the one I'm using has "move", as if the author (Arnd)
made an update
to the patch and maybe I missed it...?

-Mike

On Mon, Mar 17, 2025 at 7:13=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi all,
>
> After merging the vfs-brauner tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> fs/orangefs/orangefs-debugfs.c:101:8: error: redefinition of 'struct __ke=
yword_mask_s'
>   101 | struct __keyword_mask_s {
>       |        ^~~~~~~~~~~~~~~~
> fs/orangefs/orangefs-debugfs.c:48:8: note: originally defined here
>    48 | struct __keyword_mask_s {
>       |        ^~~~~~~~~~~~~~~~
> fs/orangefs/orangefs-debugfs.c:119:32: error: conflicting types for 's_km=
od_keyword_mask_map'; have 'struct __keyword_mask_s[]'
>   119 | static struct __keyword_mask_s s_kmod_keyword_mask_map[] =3D {
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~
> fs/orangefs/orangefs-debugfs.c:66:32: note: previous definition of 's_kmo=
d_keyword_mask_map' with type 'struct __keyword_mask_s[18]'
>    66 | static struct __keyword_mask_s s_kmod_keyword_mask_map[] =3D {
>       |                                ^~~~~~~~~~~~~~~~~~~~~~~
> fs/orangefs/orangefs-debugfs.c:140:18: error: redefinition of 'num_kmod_k=
eyword_mask_map'
>   140 | static const int num_kmod_keyword_mask_map =3D (int)
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
> fs/orangefs/orangefs-debugfs.c:87:18: note: previous definition of 'num_k=
mod_keyword_mask_map' with type 'int'
>    87 | static const int num_kmod_keyword_mask_map =3D (int)
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> Caused by commit
>
>   50fb0a7f43c0 ("orangefs: Move s_kmod_keyword_mask_map to orangefs-debug=
fs.c")
>
> merging badly with commit
>
>   063f8013373a ("orangefs: move s_kmod_keyword_mask_map[] into debugfs.c"=
)
>
> from the orangefs tree.
>
> I have applied the following merge fix patch.
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 18 Mar 2025 09:43:37 +1100
> Subject: [PATCH] fix up for bad merge of "orangefs: Move
>  s_kmod_keyword_mask_map to orangefs-debugfs.c"
>
> with "orangefs: move s_kmod_keyword_mask_map[] into debugfs.c" from the
> oragngefs tree.
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  fs/orangefs/orangefs-debugfs.c | 43 ----------------------------------
>  1 file changed, 43 deletions(-)
>
> diff --git a/fs/orangefs/orangefs-debugfs.c b/fs/orangefs/orangefs-debugf=
s.c
> index 98b52ceaf011..f7095c91660c 100644
> --- a/fs/orangefs/orangefs-debugfs.c
> +++ b/fs/orangefs/orangefs-debugfs.c
> @@ -97,49 +97,6 @@ static const int num_kmod_keyword_mask_map =3D (int)
>  #define ORANGEFS_VERBOSE "verbose"
>  #define ORANGEFS_ALL "all"
>
> -/* a private internal type */
> -struct __keyword_mask_s {
> -       const char *keyword;
> -       __u64 mask_val;
> -};
> -
> -/*
> - * Map all kmod keywords to kmod debug masks here. Keep this
> - * structure "packed":
> - *
> - *   "all" is always last...
> - *
> - *   keyword     mask_val     index
> - *     foo          1           0
> - *     bar          2           1
> - *     baz          4           2
> - *     qux          8           3
> - *      .           .           .
> - */
> -static struct __keyword_mask_s s_kmod_keyword_mask_map[] =3D {
> -       {"super", GOSSIP_SUPER_DEBUG},
> -       {"inode", GOSSIP_INODE_DEBUG},
> -       {"file", GOSSIP_FILE_DEBUG},
> -       {"dir", GOSSIP_DIR_DEBUG},
> -       {"utils", GOSSIP_UTILS_DEBUG},
> -       {"wait", GOSSIP_WAIT_DEBUG},
> -       {"acl", GOSSIP_ACL_DEBUG},
> -       {"dcache", GOSSIP_DCACHE_DEBUG},
> -       {"dev", GOSSIP_DEV_DEBUG},
> -       {"name", GOSSIP_NAME_DEBUG},
> -       {"bufmap", GOSSIP_BUFMAP_DEBUG},
> -       {"cache", GOSSIP_CACHE_DEBUG},
> -       {"debugfs", GOSSIP_DEBUGFS_DEBUG},
> -       {"xattr", GOSSIP_XATTR_DEBUG},
> -       {"init", GOSSIP_INIT_DEBUG},
> -       {"sysfs", GOSSIP_SYSFS_DEBUG},
> -       {"none", GOSSIP_NO_DEBUG},
> -       {"all", GOSSIP_MAX_DEBUG}
> -};
> -
> -static const int num_kmod_keyword_mask_map =3D (int)
> -       (ARRAY_SIZE(s_kmod_keyword_mask_map));
> -
>  /*
>   * An array of client_debug_mask will be built to hold debug keyword/mas=
k
>   * values fetched from userspace.
> --
> 2.45.2
>
> --
> Cheers,
> Stephen Rothwell

