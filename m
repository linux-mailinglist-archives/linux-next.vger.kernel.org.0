Return-Path: <linux-next+bounces-7303-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30933AF0989
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 06:02:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8538E189D498
	for <lists+linux-next@lfdr.de>; Wed,  2 Jul 2025 04:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53A3014B950;
	Wed,  2 Jul 2025 04:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BuJX+ZGW"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58A5184;
	Wed,  2 Jul 2025 04:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751428924; cv=none; b=hi3LXyHwT3S9ahyd9vZmusUOsj/HukUfv/ZKhgwRE6ovgRfh/ZpMo4N3ZCHMElNcRcMC6bCJTvOSmmjyiSaM/omPmgxSsZYcPqIRPtpkcK1VN7fL93HBzrQUID+HqL32iQ5rp7hD19uIVXL10fYIddtzDd7NieFBtyrXqTtwNUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751428924; c=relaxed/simple;
	bh=/rnXE6iehJlVK2XC+14Ht/SP4PakBHra0k8mxGCTHUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rewcds30Oe0jp55uyc7HNVV72uOn3xU2x0lTswiO6ST/pCjJYxj1RmhJlsRRn20S+OQmioor7ZFgtg3w2l2NP3adJEut3jLkbP+rjSsnqPh9bGfbWPntL7h+d3twTyv1WaeOrGca9TuP0qZulWxN6cU79AxTbrsEEWiyQk2IdIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BuJX+ZGW; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-23aeac7d77aso35695505ad.3;
        Tue, 01 Jul 2025 21:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751428922; x=1752033722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fPc3/FNRdKJSVDQyCfH8Z0YkqmfgT6t+Qo8+IS/AMcM=;
        b=BuJX+ZGWI6cc6nia6hLAwmowPs+i68W5yVSbySvCDBIYeThppktyoUFqds9MFJhnoE
         RX77mCNnPGiq3b5oITXVCTCU8zKi+h3Z6BMXt4MMsXX3rNmgqAE8Fzp2TK1OzrMjAXLi
         9Mnded7jhFFE2wWHkMBdkA4ZZPzIMkiQ6hXQM2mbaCH+OVuYvyr2sjnhBU4ACfpT0Naz
         BcXiWwct2qiJtrARyGFYOlRJiF6SKsljaRS+uaxYMqDtfajhxmnEM3549yPilN1Lds/C
         1psNtfaS2fq1t3qHgegu9v3O9DxkZ1bnskzKwS5kWUV5/I21LuzJ7DzBG8u7txSyh/x1
         2uzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751428922; x=1752033722;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPc3/FNRdKJSVDQyCfH8Z0YkqmfgT6t+Qo8+IS/AMcM=;
        b=gahMRsvPrhCW01lQdoPhAnfvueJLwcLnXCF4MSRX+yKU4b6LP4JkgxIPz0bQKkJZXn
         zuYfhKdtp8BfB4VfjsZs7Gn/rSAzmJxIfzSRVFEiPdn6Ui5UrdNiUFEwRPGwNaxw5Dl1
         M/mjYZr14DMNzT62rj4LCRGKBCby5PLoI/Whln21b6bJABt3SqqNcCzzSXitpsmv4G1X
         Y+gjQdf05/vgEE/yFE0TebSGuQTQCsOGmpYp2IlVXrzHYh3sIhwXqJG2b+nq/OkiHFSO
         HJ9YHG1HDeRPhi79dSnhbzU1o+xbnFKuHXsotuXvjacERPrP8CqDyQCG8YaI5y1kfd45
         cHhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwYKiKpWfJOCNM/H3uqdgf+W2GQAVNlV3Qa3ciqHQgPQ+murx7Ayrym+mIp92o8dWRdyK549yTNN8n@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf/HKGEeqdDKi62Lrx2N0z1oLyk9ti7Dqg3yPrsYeZM6yp4vUl
	uANcXHw+Vg/0G0n2JHenxHMe1Q4lMab3GuHKKKvI/ln7lO/nf9DK9LG8
X-Gm-Gg: ASbGncvTPHRB3ZvAchnf2S0ER94VxDozroxWOivKnW/Vdl45xf/AaIeseD+0laLqXGz
	+kNsbRpvaSS2Fz/yt+rDBGPlm33+n+B3gR3qUC5duMKjG8wuSBw2XylmNw3xilfHdehvxCEYuMp
	1xH07bNtAc8XufUmPpKmXIFBJVPWZy6LV03I5861FRSWeLuSm9FNQPPRqteyDvThWAUV1zPvMl7
	QV540bzsJU0cWG/TRB0xwfW4vP1bxuRAfr7CoR59lLqUzRPJZ7cxuEYPcC+o1LHwq7/d1tXL4ym
	6JJ7cO87veaggV2G7FuCiNkCfQ30g+Wf9O95cftkg5HnA0/rvZrh66R84+vqMZQ=
X-Google-Smtp-Source: AGHT+IFQUXwpmYvLmoLyQnpgkSh/C2B2tRaDQNGJW8bp3DqaEsbje+DAN9dsbfMCTsMqmhE8N7GraQ==
X-Received: by 2002:a17:902:d502:b0:223:4537:65b1 with SMTP id d9443c01a7336-23c6e511df6mr22039855ad.36.1751428922120;
        Tue, 01 Jul 2025 21:02:02 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:918b:9ece:525a:9158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c4b23sm118443105ad.214.2025.07.01.21.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 21:02:01 -0700 (PDT)
Date: Tue, 1 Jul 2025 21:01:58 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the input tree
Message-ID: <xj44nzcwvbkbukeuo6c74q7jc3z4ramffz3m6n7qeqjhzbze7z@mksouznt77gg>
References: <20250702134732.55fe8f91@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702134732.55fe8f91@canb.auug.org.au>

On Wed, Jul 02, 2025 at 01:47:32PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the input tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> drivers/input/input.c: In function 'input_bits_to_string':
> drivers/input/input.c:1007:13: error: implicit declaration of function 'in_compat_syscall' [-Wimplicit-function-declaration]
>  1007 |         if (in_compat_syscall()) {
>       |             ^~~~~~~~~~~~~~~~~
> 
> Presumably caused by commit
> 
>   de7dd46319bb ("Input: stop including input-compat.h")
> 
> I have used the input tree from next-20250701 for today.
> 

Thanks Stephen, I better drop that patch and instead move this chunk of
code into input-compat.c as well.

-- 
Dmitry

