Return-Path: <linux-next+bounces-1428-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66EE486DAD7
	for <lists+linux-next@lfdr.de>; Fri,  1 Mar 2024 05:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 849ADB24839
	for <lists+linux-next@lfdr.de>; Fri,  1 Mar 2024 04:46:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D1954EB3A;
	Fri,  1 Mar 2024 04:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="g7SOJsdc"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A9764F8B2
	for <linux-next@vger.kernel.org>; Fri,  1 Mar 2024 04:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709268375; cv=none; b=YC1vj3Ecn3caVXgCsVphoGjFLiaycUuul4C7hLcarwT5B3Q10JmpyoxYNclwy0ezv/qeYAA+ju5dzXtkGWQ8Tl6GB+OVlk6PkRzr29nncGOoY4Zlp5uAPX3jFCWuAHgzW/o9VQjtApWj6nuxX3Gh0bPcI9M9fJ21VtBFb7KFpxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709268375; c=relaxed/simple;
	bh=aqanbP1fd//AY1W1CtbSFnnliQmAybZXXSfBN8jvp8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tyLN4LbXtW/35lYgsG/VR05x7A08u9gQZl9LfbArO1QRv2eZzuMvtAxIaVhFwQJcSVowXyD/8ZQ8RAlggpVwUCoRIJq0TPy47GPYEtinVT41k+YBCnUae8HzsMQJnlWsRgqeuGnioGT/Wjn/Rr8NfbsTAjSv7VLae9xzMGcRY74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=g7SOJsdc; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-6e48e2270d0so936769a34.3
        for <linux-next@vger.kernel.org>; Thu, 29 Feb 2024 20:46:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709268372; x=1709873172; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A4eRNj33S0EQ0KibJ3OF5h9qoyTRV7LTJjYiIo6fwvU=;
        b=g7SOJsdc9IekSEsJVVqNOyFCXLkMt04m5qeq/b0Ha1pVJWRErCa8Mpju4O+i3+Pb6N
         Bk6lBV61Xeyr9U5iSKWLSxtPtHCXKOb5zJBRxbrECascqySsEgymhIzmqm9qbW0WQNVp
         KTm/m0R/Syb3/Ujrh51zWVcenqhjMhRW3Ecpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709268372; x=1709873172;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A4eRNj33S0EQ0KibJ3OF5h9qoyTRV7LTJjYiIo6fwvU=;
        b=F6H/RGonk3dLfPTMdiNwiHKwvmoYNbua09HwoGyEDwJUoFEzmCn308J4efy0N46Kvj
         gQRkRgikDKCIDXlK5u/l0YqfqLDIs6nMuWWkmRzpxrS6gN//C4f0VSmlhij4kZefcPwt
         LVMhuimXhiA3kbSbMKQ4GKrbGebq6WhcYBnvqMmxRY3y51tgTkn/FsROanfJMTzoi6kq
         pdx9bhgYmVRNXGfsKDqvEmOsq+4vhMjn/nE8oIgZ9nx9mma9z5qtrYTYzw1Dt6HXFUS5
         Llz3Luf6JxknGbfBpmBL8n92tgvd8NUQMZTy2zbbgw4m9/W+O3dQag5sRN4w8lRam7ZI
         p3Gg==
X-Forwarded-Encrypted: i=1; AJvYcCU/5zldE5QWOS/tIHFgCy7CvG0fG0E4MKmWdqaBwDAJUfREto2rTOIw8JRlqdkl/d9R5ZtFGgf7Ymf5ZramIoHiMY1tXDYJ3f/BRA==
X-Gm-Message-State: AOJu0YwR+Tx8L1rs6BeO4DEIHGcUDqFwe9fJwAQhdLJ0WgNdo9FyrRJw
	haRlqXyxDnfafQp70h5SDkDtUuHtkj7yOh06sfMZF21x9Nu6fLygiMDA7s8OFQ==
X-Google-Smtp-Source: AGHT+IGmrZQ+TxHS3qSfDERz10S2q6AElK98O6CjtHG0Qhi117G4SEIeJ2VEYsC3I580vrsgZKYwFg==
X-Received: by 2002:a9d:6b93:0:b0:6e4:934d:41fa with SMTP id b19-20020a9d6b93000000b006e4934d41famr700436otq.22.1709268372530;
        Thu, 29 Feb 2024 20:46:12 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id c2-20020a6566c2000000b005e49bf50ff9sm1903984pgw.0.2024.02.29.20.46.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 20:46:11 -0800 (PST)
Date: Thu, 29 Feb 2024 20:46:11 -0800
From: Kees Cook <keescook@chromium.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the kspp tree with the bcachefs tree
Message-ID: <202402292045.260F6FA8@keescook>
References: <20240301154351.1d097566@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240301154351.1d097566@canb.auug.org.au>

On Fri, Mar 01, 2024 at 03:43:51PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kspp tree got a conflict in:
> 
>   lib/Makefile
> 
> between commit:
> 
>   f6099c0b0300 ("darray: lift from bcachefs")
> 
> from the bcachefs tree and commit:
> 
>   257e66e5800a ("string: Convert selftest to KUnit")
> 
> from the kspp tree.
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
> 
> diff --cc lib/Makefile
> index ec3d915e7889,97c42e38046f..000000000000
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@@ -48,10 -48,10 +48,10 @@@ obj-y += bcd.o sort.o parser.o debug_lo
>   	 bsearch.o find_bit.o llist.o lwq.o memweight.o kfifo.o \
>   	 percpu-refcount.o rhashtable.o base64.o \
>   	 once.o refcount.o rcuref.o usercopy.o errseq.o bucket_locks.o \
>  -	 generic-radix-tree.o bitmap-str.o
>  +	 generic-radix-tree.o bitmap-str.o darray.o
> - obj-$(CONFIG_STRING_SELFTEST) += test_string.o
> + obj-$(CONFIG_STRING_KUNIT_TEST) += string_kunit.o
>   obj-y += string_helpers.o
> - obj-$(CONFIG_TEST_STRING_HELPERS) += test-string_helpers.o
> + obj-$(CONFIG_STRING_HELPERS_KUNIT_TEST) += string_helpers_kunit.o
>   obj-y += hexdump.o
>   obj-$(CONFIG_TEST_HEXDUMP) += test_hexdump.o
>   obj-y += kstrtox.o

Thanks! This looks correct to me.

-- 
Kees Cook

