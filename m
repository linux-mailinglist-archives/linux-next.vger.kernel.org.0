Return-Path: <linux-next+bounces-271-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C65AE808D69
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 17:32:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 025B61C20A41
	for <lists+linux-next@lfdr.de>; Thu,  7 Dec 2023 16:32:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46559481B6;
	Thu,  7 Dec 2023 16:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tiK93JOw"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E26112D
	for <linux-next@vger.kernel.org>; Thu,  7 Dec 2023 08:32:39 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d0538d9bbcso9379975ad.3
        for <linux-next@vger.kernel.org>; Thu, 07 Dec 2023 08:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1701966759; x=1702571559; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6s/G2fCaPsfjUltC6wP5KXnRvEhfZWy1kUDC1w9CkeU=;
        b=tiK93JOw6EPMlDBLuaJ/56pp8ogzhRE44uzkXTpapanoNVxCbmfA3JCwlBCothnklj
         D0CDgbkSyMrxwut27IKSkZ+JNz83pnmsUSv30MWZi7FUZhEDbvgDMtGSNkEoSR2bEFDt
         AdBM7NtZzQ3PIyE30dZ3dAGDiwzewJCTSr59ov/i+zs8tU6DPytidoA9LAeJu8aFmaZo
         KWVMnub4fVgmkx/91jyqHqM+0rbUHnfOfg2ZQEpNVwvDgR3NyaTEkAShO5jJKa6w/3Es
         w1R9x+VAznk4DHhunBmSXPX5ucXq8PXkBVy7MERjHnczqfgFaHUz2cmOV0BZ8xCXm3MQ
         w8ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701966759; x=1702571559;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6s/G2fCaPsfjUltC6wP5KXnRvEhfZWy1kUDC1w9CkeU=;
        b=UrooViNnydffS0d76Jf5y2SgDGwxA76qsz4b/01l5qT5I9xXuCIcACmbXgiNEELBaf
         ulK4jnj1L1FyMWQWizpQbVvoUOCeSEjwRWs/Ij2N5hrX/yebdDpoO2JLdUKXL+SOftEt
         Nt3YpA3KM2csTQ/mUyAHdjtuBZ/AAJIxgGxMjB5C/xb08Ry3cVuRKKQiY/083M1gKC2v
         U4fagS44RE++1/UQnuEp00OSAldHdE5HdPZ56wLD2s+B65NMmXTCa/suga1/O0kgy1IV
         86QHHmfT5yglPB6aSgZDzus8zCh+qOykx3Q92Q//JSQqWatbIJcye+lIkRE5Gzt1m6vT
         Rxrw==
X-Gm-Message-State: AOJu0YzwXyiIYgc7TF8/JB3f2FKCvBh81mXzKgiQ1YLgfKJuiY8NoawJ
	dAAQeYml3/wqYWdpSvz7kqxKDA==
X-Google-Smtp-Source: AGHT+IF7Xpf8qGhXSViJn/hwJ0E80pM/or7yhBmz9pZajunl52yozMy7wL1M2cV5+TGdlip1I553Fg==
X-Received: by 2002:a17:902:c411:b0:1d0:8e61:1020 with SMTP id k17-20020a170902c41100b001d08e611020mr3546038plk.89.1701966758757;
        Thu, 07 Dec 2023 08:32:38 -0800 (PST)
Received: from google.com (170.102.105.34.bc.googleusercontent.com. [34.105.102.170])
        by smtp.gmail.com with ESMTPSA id j18-20020a170902c3d200b001cc3a6813f8sm6281plj.154.2023.12.07.08.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 08:32:38 -0800 (PST)
Date: Thu, 7 Dec 2023 16:32:34 +0000
From: Carlos Llamas <cmllamas@google.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Nhat Pham <nphamcs@gmail.com>
Subject: Re: linux-next: manual merge of the char-misc tree with the mm tree
Message-ID: <ZXHzooF07LfQQYiE@google.com>
References: <20231207134213.25631ae9@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231207134213.25631ae9@canb.auug.org.au>

On Thu, Dec 07, 2023 at 01:42:13PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the char-misc tree got a conflict in:
> 
>   drivers/android/binder_alloc.c
> 
> between commit:
> 
>   8b59d7857c30 ("list_lru: allow explicit memcg and NUMA node selection")
> 
> from the mm tree and commits:
> 
>   ea9cdbf0c727 ("binder: rename lru shrinker utilities")
>   ea2735ce19c1 ("binder: refactor page range allocation")
> (and maybe others)
> 
> from the char-misc tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> -- 
> Cheers,
> Stephen Rothwell

Oh I wasn't aware of this patch. Thanks for fixing it Stephen!

I checked the diff against the char-misc tree and it looks correct. It's
a much much easier read too. I'll post it below if anyone is interested.

--
Carlos Llamas

diff --git a/drivers/android/binder_alloc.c b/drivers/android/binder_alloc.c
index a4a4dc87ba53aa..ea5e1ba2d0d77f 100644
--- a/drivers/android/binder_alloc.c
+++ b/drivers/android/binder_alloc.c
@@ -210,7 +210,7 @@ static void binder_lru_freelist_add(struct binder_alloc *alloc,

 		trace_binder_free_lru_start(alloc, index);

-		ret = list_lru_add(&binder_freelist, &page->lru);
+		ret = list_lru_add_obj(&binder_freelist, &page->lru);
 		WARN_ON(!ret);

 		trace_binder_free_lru_end(alloc, index);
@@ -317,7 +317,7 @@ static void binder_lru_freelist_del(struct binder_alloc *alloc,
 		if (page->page_ptr) {
 			trace_binder_alloc_lru_start(alloc, index);

-			on_lru = list_lru_del(&binder_freelist, &page->lru);
+			on_lru = list_lru_del_obj(&binder_freelist, &page->lru);
 			WARN_ON(!on_lru);

 			trace_binder_alloc_lru_end(alloc, index);
@@ -931,7 +931,7 @@ void binder_alloc_deferred_release(struct binder_alloc *alloc)
 			if (!alloc->pages[i].page_ptr)
 				continue;

-			on_lru = list_lru_del(&binder_freelist,
+			on_lru = list_lru_del_obj(&binder_freelist,
 					      &alloc->pages[i].lru);
 			page_addr = alloc->buffer + i * PAGE_SIZE;
 			binder_alloc_debug(BINDER_DEBUG_BUFFER_ALLOC,
@@ -1307,4 +1307,3 @@ int binder_alloc_copy_from_buffer(struct binder_alloc *alloc,
 	return binder_alloc_do_buffer_copy(alloc, false, buffer, buffer_offset,
 					   dest, bytes);
 }
-

