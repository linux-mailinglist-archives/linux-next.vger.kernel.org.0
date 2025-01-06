Return-Path: <linux-next+bounces-5061-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E6CA02F2C
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 18:40:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5D84F162720
	for <lists+linux-next@lfdr.de>; Mon,  6 Jan 2025 17:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A136A1DED4A;
	Mon,  6 Jan 2025 17:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="icr1nT7U"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F8918A6AC;
	Mon,  6 Jan 2025 17:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736185205; cv=none; b=cXwpmmIqjaFvHccE0j01Jt4mRAO44mAyZr6YnFVvBolHxH9HtGe04op7Zqk22FntHqr2XFHxDYdzQ0cwemUwGxcGUq9qL5XqDeoXvN241gPCqEhKTOpXIs8QLx4YXeEFuqBx+07oUwR2mtIzD43sxnyEi9KB6n4+8FrjnZIUFJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736185205; c=relaxed/simple;
	bh=VOMwtGQmapBj0H9rg979Xvwbil+GHAg/seJzyTI0zhk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kTJiQ8rUgtyboL2Ypchlc3/H/vmIxkgnzsGxBiV6/Ab7viltl7JdXMZ7l71NEAMx8rBcXIZ/kE+BXVsbwNgufVSecgl7cXV5kizYv9KhNe7Qd53nt0gb1euB7GodfdKHKV2+FbodBZ7ABCHaunX4tkg/DtYig2RNQO85bTJx918=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=icr1nT7U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9067EC4CEDF;
	Mon,  6 Jan 2025 17:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736185205;
	bh=VOMwtGQmapBj0H9rg979Xvwbil+GHAg/seJzyTI0zhk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=icr1nT7UFUsi70NthbsCzJ3kD9/NHc/Ua+kiUZte8ElxgRw1Jvx0d1yYVpoGZRKvk
	 HVgrOGmoN6hgMnsXzNEovj5w3ZXr6Q59uqkLsxGWobCQ9wj1nBOc7pt5bHhSAnuSo9
	 XCf3lx2oBSm6KWYYilqUhPJL8hKSfRAp4xaXY5/W1Tjbk8wJoeQ8d+jaqbboCHLpXq
	 NjXYWWp1heCV9L49vQuU8bc4QlmYOF6YLYXP5lVlbylh81ZkN4lq7CpDcaPj0ETeP3
	 m9v8R6uo9Q+Qfxw+oU0+XT5+2WafR9YllIVP1G0/FvWa+gNi81NOqa6nh4IUOXxsw5
	 tcAoJKDIRoPQA==
Message-ID: <04fafa6fd58252bf74b9606278ff5d68cb62c102.camel@kernel.org>
Subject: Re: [PATCH -next] samples/vfs/mountinfo: Use __u64 instead of
 uint64_t
From: Jeff Layton <jlayton@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Christian Brauner
	 <brauner@kernel.org>
Cc: linux-next@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 06 Jan 2025 12:40:03 -0500
In-Reply-To: <20250106134802.1019911-1-geert+renesas@glider.be>
References: <20250106134802.1019911-1-geert+renesas@glider.be>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2025-01-06 at 14:48 +0100, Geert Uytterhoeven wrote:
> On 32-bit (e.g. arm32, m68k):
>=20
>     samples/vfs/mountinfo.c: In function =E2=80=98dump_mountinfo=E2=80=99=
:
>     samples/vfs/mountinfo.c:145:29: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 2 has type =E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long long unsigned int=
=E2=80=99} [-Wformat=3D]
>       145 |                 printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_=
id, buf->mnt_parent_id);
> 	  |                           ~~^                 ~~~~~~~~~
> 	  |                             |                 |
> 	  |                             long unsigned int uint64_t {aka long lon=
g unsigned int}
> 	  |                           %llx
>     samples/vfs/mountinfo.c:145:35: warning: format =E2=80=98%lx=E2=80=99=
 expects argument of type =E2=80=98long unsigned int=E2=80=99, but argument=
 3 has type =E2=80=98uint64_t=E2=80=99 {aka =E2=80=98long long unsigned int=
=E2=80=99} [-Wformat=3D]
>       145 |                 printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_=
id, buf->mnt_parent_id);
> 	  |                                 ~~^                      ~~~~~~
> 	  |                                   |                      |
> 	  |                                   long unsigned int      uint64_t {a=
ka long long unsigned int}
> 	  |                                 %llx
>=20
> Just using "%llx" instead of "%lx" is not sufficient, as uint64_t is
> "long unsigned int" on some 64-bit platforms like arm64.  Hence also
> replace "uint64_t" by "__u64", which matches what most other samples
> are already using.
>=20
> Fixes: d95e49bf8bcdc7c1 ("samples: add a mountinfo program to demonstrate=
 statmount()/listmount()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Feel free to fold into the original commit.
>=20
> Alternatively, you can use PRIx64, which is used by tools/, but not by
> any of the current samples.
> ---
>  samples/vfs/mountinfo.c | 35 +++++++++++++++++------------------
>  1 file changed, 17 insertions(+), 18 deletions(-)
>=20
> diff --git a/samples/vfs/mountinfo.c b/samples/vfs/mountinfo.c
> index 2b17d244d321ee75..f47c035cc339544e 100644
> --- a/samples/vfs/mountinfo.c
> +++ b/samples/vfs/mountinfo.c
> @@ -32,9 +32,9 @@ static bool ext_format;
>   * There are no bindings in glibc for listmount() and statmount() (yet),
>   * make our own here.
>   */
> -static int statmount(uint64_t mnt_id, uint64_t mnt_ns_id, uint64_t mask,
> -			    struct statmount *buf, size_t bufsize,
> -			    unsigned int flags)
> +static int statmount(__u64 mnt_id, __u64 mnt_ns_id, __u64 mask,
> +		     struct statmount *buf, size_t bufsize,
> +		     unsigned int flags)
>  {
>  	struct mnt_id_req req =3D {
>  		.size =3D MNT_ID_REQ_SIZE_VER0,
> @@ -50,9 +50,8 @@ static int statmount(uint64_t mnt_id, uint64_t mnt_ns_i=
d, uint64_t mask,
>  	return syscall(__NR_statmount, &req, buf, bufsize, flags);
>  }
> =20
> -static ssize_t listmount(uint64_t mnt_id, uint64_t mnt_ns_id,
> -			 uint64_t last_mnt_id, uint64_t list[], size_t num,
> -			 unsigned int flags)
> +static ssize_t listmount(__u64 mnt_id, __u64 mnt_ns_id, __u64 last_mnt_i=
d,
> +			 __u64 list[], size_t num, unsigned int flags)
>  {
>  	struct mnt_id_req req =3D {
>  		.size =3D MNT_ID_REQ_SIZE_VER0,
> @@ -68,7 +67,7 @@ static ssize_t listmount(uint64_t mnt_id, uint64_t mnt_=
ns_id,
>  	return syscall(__NR_listmount, &req, list, num, flags);
>  }
> =20
> -static void show_mnt_attrs(uint64_t flags)
> +static void show_mnt_attrs(__u64 flags)
>  {
>  	printf("%s", flags & MOUNT_ATTR_RDONLY ? "ro" : "rw");
> =20
> @@ -112,7 +111,7 @@ static void show_propagation(struct statmount *sm)
>  		printf(" unbindable");
>  }
> =20
> -static void show_sb_flags(uint64_t flags)
> +static void show_sb_flags(__u64 flags)
>  {
>  	printf("%s", flags & MS_RDONLY ? "ro" : "rw");
>  	if (flags & MS_SYNCHRONOUS)
> @@ -125,15 +124,15 @@ static void show_sb_flags(uint64_t flags)
>  		printf(",lazytime");
>  }
> =20
> -static int dump_mountinfo(uint64_t mnt_id, uint64_t mnt_ns_id)
> +static int dump_mountinfo(__u64 mnt_id, __u64 mnt_ns_id)
>  {
>  	int ret;
>  	struct statmount *buf =3D alloca(STATMOUNT_BUFSIZE);
> -	const uint64_t mask =3D STATMOUNT_SB_BASIC | STATMOUNT_MNT_BASIC |
> -				STATMOUNT_PROPAGATE_FROM | STATMOUNT_FS_TYPE |
> -				STATMOUNT_MNT_ROOT | STATMOUNT_MNT_POINT |
> -				STATMOUNT_MNT_OPTS | STATMOUNT_FS_SUBTYPE |
> -				STATMOUNT_SB_SOURCE;
> +	const __u64 mask =3D STATMOUNT_SB_BASIC | STATMOUNT_MNT_BASIC |
> +			   STATMOUNT_PROPAGATE_FROM | STATMOUNT_FS_TYPE |
> +			   STATMOUNT_MNT_ROOT | STATMOUNT_MNT_POINT |
> +			   STATMOUNT_MNT_OPTS | STATMOUNT_FS_SUBTYPE |
> +			   STATMOUNT_SB_SOURCE;
> =20
>  	ret =3D statmount(mnt_id, mnt_ns_id, mask, buf, STATMOUNT_BUFSIZE, 0);
>  	if (ret < 0) {
> @@ -142,7 +141,7 @@ static int dump_mountinfo(uint64_t mnt_id, uint64_t m=
nt_ns_id)
>  	}
> =20
>  	if (ext_format)
> -		printf("0x%lx 0x%lx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id);
> +		printf("0x%llx 0x%llx 0x%llx ", mnt_ns_id, mnt_id, buf->mnt_parent_id)=
;
> =20
>  	printf("%u %u %u:%u %s %s ", buf->mnt_id_old, buf->mnt_parent_id_old,
>  				   buf->sb_dev_major, buf->sb_dev_minor,
> @@ -166,10 +165,10 @@ static int dump_mountinfo(uint64_t mnt_id, uint64_t=
 mnt_ns_id)
>  	return 0;
>  }
> =20
> -static int dump_mounts(uint64_t mnt_ns_id)
> +static int dump_mounts(__u64 mnt_ns_id)
>  {
> -	uint64_t mntid[MAXMOUNTS];
> -	uint64_t last_mnt_id =3D 0;
> +	__u64 mntid[MAXMOUNTS];
> +	__u64 last_mnt_id =3D 0;
>  	ssize_t count;
>  	int i;
> =20

Many thanks. I missed that bit of the fix.

Reviewed-by: Jeff Layton <jlayton@kernel.org>

