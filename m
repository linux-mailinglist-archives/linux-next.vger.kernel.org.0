Return-Path: <linux-next+bounces-9160-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 190B4C7E97F
	for <lists+linux-next@lfdr.de>; Mon, 24 Nov 2025 00:25:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B61763A3E18
	for <lists+linux-next@lfdr.de>; Sun, 23 Nov 2025 23:25:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF5921DD543;
	Sun, 23 Nov 2025 23:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="WUCGF/5O"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9621CEADB
	for <linux-next@vger.kernel.org>; Sun, 23 Nov 2025 23:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763940334; cv=none; b=TgzAT15aucb5nYPGvDSj78C/Moho/KfEVI0McvJvhWY+jQtFgzBJxMjkgb9OqoWM7AIy2wdNXV520wA/Y+X3c5BIrIZeGTd9BAnx9btOERG6SKmFhjmNxIJouoxvrEvKrb9cfyiAt/tgQTW1qep5BY7lrMSj/EwW8WdfTbZUcko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763940334; c=relaxed/simple;
	bh=erFdT05xcZODndAvhzpnM3jNNUD2ccezHMRzF2RjdCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eaIH5VPCude/wijJchyjMWLudIz43PqVHe3+xwMoHOYPFGbPFW/FsoXt/KiUVRDFQe8XPYexlwbm6foR3tyL8urwRAhwDCdeN5h9oyGM68EY6moCLk2cWYAecUATu+SVX1TkZ8MK+PYvndzvvVCupqz9Y/xdIlIIz9DGB9IQNd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=WUCGF/5O; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so20706345e9.3
        for <linux-next@vger.kernel.org>; Sun, 23 Nov 2025 15:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763940330; x=1764545130; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=ndqg3JaTIm7dUnnTrPdnX/z7F0O0uIBf1cc+snhl7LE=;
        b=WUCGF/5OsfbKK2keteiola+H9r0Zu7tRE+cMaJ05JUdPkPdn+e6pH7na5CdFhRZ9NO
         WAarFqGrk2bNCpuDASK9ENR5WiSrzJ/CY7d9axiqaBi1Kluo3eCOTyixY0EJJjrTHi+O
         W7IAmR/XKi0SrZaLNn4WSbysigmgeeZRCbZcrWb+MHu1szkr6T/IhkfCDxoN8UaUCGh6
         gwG+WNVoq8cjlD1YXc8792/ftlUA/6H+9xe+Z70S+SeblLQJ6kGRDV6p/ILmm+IIEAmA
         G8sCgfcR2nOCkCyKB1xskOwLuMpTJZrWkZKaCmryMhoqtO/EICwrhNV9/izqEg1Vqj5k
         bgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763940330; x=1764545130;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndqg3JaTIm7dUnnTrPdnX/z7F0O0uIBf1cc+snhl7LE=;
        b=QL7ovQg9E32QuKD7A8AHM2dnQ3YvfO4va6BdYLRI+Vw2vSXrwpzAhLLH3Z5X1E22VU
         V8GCA6fieneatR6fC1Mm/BPvpnB1Cu1/3qBxjfOfIeqHZB9ujFelQpLJUcLJRfXC3sIQ
         TtXiZhyRgwYBv1k9OsCNvBJbSA1r7oNFOybloR3sOD8OddxyQ5ruAKh+LZ2lZUOjrR8q
         sSOtB4OzX2yI+AREXgoyj0gKThVWORHa1GXCxE2Crt7ZMiP8vJJ6bYkGjG8jWuXe6Tl/
         jHRo5TDcsh/wGi8tLIRu1PGMP0AsW3acP7xwZwbKplGXfqvssUFEXxaRkelWDo2t91ip
         rD6A==
X-Forwarded-Encrypted: i=1; AJvYcCXr9txLWBVnjz3aMBW2IRKTGsYw08mlzZNMCHbIFCD6z4iExfUZE0wQGtbfgeGwRqRmMHE3w21o59vs@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn9hw6KY782c/ABKtzv/Yx4ssJqgbgJfJa/kzkcL6K/wKUlGFK
	SohVmhuDwhyzZn8sSWAjmtaz817ewVAqxqYEz0o5h/EBFwFOEWr4KqAALePV/yrSrGQ=
X-Gm-Gg: ASbGncvkXEwBmtXhs/9VoeM4LDhV5KJH5P+hhKSwo64/nBl0ar/wIUVU2kPGF2MTSlL
	VGUyLeen8yGkt6MrusTS0P67U1oKKCYDeXA70AO3BPtITdWBgWX5/O+RH50TTvHMTSBDpFN2wML
	nURu4rV7SvDTMQvP1svCF9E8cnQL/fHHhFSX1cyt+4AiP4s3U5fJbG6xeW5Jy8eZA11n3IVZY6q
	JTA1UnkET698sfKVeXTY7TUw7+47Di5NLTFRjDBJjGfoBRI4xLXkHVDXOb+E4fUqbcMFJdlT48W
	bLYPQ6LxVV6BoHEpxO20jl1EAlSqgSWkV7k4syYutF8mH71eBXCf+Gt2mk97GC1yXYSJoIfdflA
	EwGqPvNN8XxgjqFel+adt0DJKplZNHHBgX1DFn9yIFBHFp0GDk1vH5oH0RPIDU8E/W3SkwdsSnY
	+GDD117lAcMIL5Kt1pEeghc0sZFJZUlwhjZYPRPYE=
X-Google-Smtp-Source: AGHT+IE0py4XhALZLY56cDwRVKNXCWAd0RUYjvx7lUp3XfthiBohVBmKeDdVPEzMaT9ITHBh8uIctQ==
X-Received: by 2002:a05:600c:354a:b0:477:97ca:b727 with SMTP id 5b1f17b1804b1-477c01b21bcmr83670485e9.19.1763940330483;
        Sun, 23 Nov 2025 15:25:30 -0800 (PST)
Received: from ?IPV6:2403:580d:fda1::299? (2403-580d-fda1--299.ip6.aussiebb.net. [2403:580d:fda1::299])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-642f71ae71dsm4304148d50.23.2025.11.23.15.25.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Nov 2025 15:25:29 -0800 (PST)
Message-ID: <6a94eecb-a729-4b39-8cee-72521d12bd70@suse.com>
Date: Mon, 24 Nov 2025 09:55:23 +1030
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: manual merge of the vfs_brauner tree with the btrfs
 tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Christian Brauner <brauner@kernel.org>, David Sterba <dsterba@suse.cz>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 David Sterba <dsterba@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20251124100508.64a6974a@canb.auug.org.au>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <20251124100508.64a6974a@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2025/11/24 09:35, Stephen Rothwell 写道:
> Hi all,
> 
> After merging the vfs-brauner tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> In file included from include/linux/bits.h:30,
>                   from include/linux/gfp_types.h:5,
>                   from include/linux/gfp.h:5,
>                   from include/linux/slab.h:16,
>                   from fs/btrfs/ordered-data.c:6:
> fs/btrfs/ordered-data.c: In function 'btrfs_mark_ordered_io_truncated':
> fs/btrfs/ordered-data.c:561:37: error: implicit declaration of function 'folio_end'; did you mean 'folio_nid'? [-Wimplicit-function-declaration]
>    561 |         ASSERT(file_offset + len <= folio_end(folio));
>        |                                     ^~~~~~~~~
> include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
>     30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
>        |                                                               ^
> fs/btrfs/ordered-data.c:561:9: note: in expansion of macro 'ASSERT'
>    561 |         ASSERT(file_offset + len <= folio_end(folio));
>        |         ^~~~~~
> In file included from include/linux/bits.h:30,
>                   from include/linux/bitops.h:6,
>                   from fs/btrfs/extent_io.c:3:
> fs/btrfs/extent_io.c: In function 'submit_range':
> fs/btrfs/extent_io.c:1621:31: error: implicit declaration of function 'folio_end'; did you mean 'folio_nid'? [-Wimplicit-function-declaration]
>   1621 |         ASSERT(start + len <= folio_end(folio));
>        |                               ^~~~~~~~~
> include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
>     30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
>        |                                                               ^
> fs/btrfs/extent_io.c:1621:9: note: in expansion of macro 'ASSERT'
>   1621 |         ASSERT(start + len <= folio_end(folio));
>        |         ^~~~~~
> 
> Caused by commit
> 
>    48f3784b17d9 ("btrfs: Use folio_next_pos()")
> 
> interatcing with commits
> 
>    98dad9ca0426 ("btrfs: reduce extent map lookup during writes")
>    c7459b067d9d ("btrfs: make sure all ordered extents beyond EOF is properly truncated")
> 
> from the btrfs tree.
> 
> I applied the following merge fix patch.

Thanks for fixing that.

Although that two patches from btrfs tree is now retracted for other 
reasons.

I'll refresh the involved patches in the next cycle when btrfs all 
migrate to folio_next_pos().

Thanks,
Qu

> 
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Mon, 24 Nov 2025 09:51:32 +1100
> Subject: [PATCH] fix up for "btrfs: Use folio_next_pos()"
> 
> interacting with commits
> 
>    98dad9ca0426 ("btrfs: reduce extent map lookup during writes")
>    c7459b067d9d ("btrfs: make sure all ordered extents beyond EOF is properly truncated")
> 
> from the btrfs tree.
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>   fs/btrfs/extent_io.c    | 2 +-
>   fs/btrfs/ordered-data.c | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
> index 995439dff185..3e4056dd8b55 100644
> --- a/fs/btrfs/extent_io.c
> +++ b/fs/btrfs/extent_io.c
> @@ -1618,7 +1618,7 @@ static int submit_range(struct btrfs_inode *inode, struct folio *folio,
>   
>   	ASSERT(IS_ALIGNED(start, sectorsize));
>   	ASSERT(IS_ALIGNED(len, sectorsize));
> -	ASSERT(start + len <= folio_end(folio));
> +	ASSERT(start + len <= folio_next_pos(folio));
>   
>   	while (cur < start + len) {
>   		struct extent_map *em;
> diff --git a/fs/btrfs/ordered-data.c b/fs/btrfs/ordered-data.c
> index 51c0a910ea81..731032b40821 100644
> --- a/fs/btrfs/ordered-data.c
> +++ b/fs/btrfs/ordered-data.c
> @@ -558,7 +558,7 @@ void btrfs_mark_ordered_io_truncated(struct btrfs_inode *inode, struct folio *fo
>   	u64 cur = file_offset;
>   
>   	ASSERT(file_offset >= folio_pos(folio));
> -	ASSERT(file_offset + len <= folio_end(folio));
> +	ASSERT(file_offset + len <= folio_next_pos(folio));
>   
>   	while  (cur < file_offset + len) {
>   		u32 cur_len = file_offset + len - cur;


