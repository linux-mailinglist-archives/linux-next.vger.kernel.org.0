Return-Path: <linux-next+bounces-994-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 681D9849A9E
	for <lists+linux-next@lfdr.de>; Mon,  5 Feb 2024 13:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B2DC1C21C1F
	for <lists+linux-next@lfdr.de>; Mon,  5 Feb 2024 12:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1BA1CA88;
	Mon,  5 Feb 2024 12:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CL7LkV1f"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629EF1CA83
	for <linux-next@vger.kernel.org>; Mon,  5 Feb 2024 12:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707137033; cv=none; b=NFixEH1NT0kYdxmr2chWqsp7SpGvS2B1VOyFLDAyuNVu1ukc+idiqnaS/+KIi5me3NeIdv9c/D/sv66Ieha15SMgbAAJ2+8uyan3iZc2sgE6gPq0GAyZBTIIHb6WykQr3dvMH9LjI2ZQGUuSXqNyc68zfJV3DpRa2h2W5dhRoQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707137033; c=relaxed/simple;
	bh=eK87dPMBYX9T1gvh4BZ+Z1SrFMPNvM/a+fzqP3gSnkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2amBn75l5cLBv8LXtQd6D/H/nt0OMEIYiTXx70PixEPxaOlgCkip4C3TCeKDsxEcYQknTNV1NYWqQQzwYnSvOdatDTNleA1zGvgFO4eOE0qomdrd1bBJHkVfAw7NJ2mMiOFROivIVpadXnRzNaKIbDMp8IaVd5Ch1/E/M7IRtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CL7LkV1f; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1d71cb97937so38354125ad.3
        for <linux-next@vger.kernel.org>; Mon, 05 Feb 2024 04:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707137032; x=1707741832; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M3UHObaFrclSeQO0Xqec9hXNPyJBu/C/OLTO/4swhUY=;
        b=CL7LkV1f2a35I82n/nNxHnnhryQiYX5MKhzuB7hl5Hmf76CezZChD3oaHXUbdtFugN
         hSNZZEQTYPe8eptRE06eyT45I26KUvGjhgO6BkMwuFd3LjTrGJ39B8SYHWXqgUN0hMBN
         QP/BG9QU5RwaWvlgxVCpovH9JNEQATWiI1YsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707137032; x=1707741832;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M3UHObaFrclSeQO0Xqec9hXNPyJBu/C/OLTO/4swhUY=;
        b=EGJkLojOefLGBMesPTgMSNEtMwl/daKcScRsqBLkKU0miWYCVhoY2o0IAt909RH/7f
         RbtG3nUQEUq0BslGg7NuoIjtQvARvWWdKcHpdadVh05agriHDaxenJAWHYBbUubeX8ra
         EEx2YicEqUmhLAjJH/OXNyhPY/gbAuHlftvPpPg8P/rLcu2gdSJwxf9G6ukNrIJUJl5T
         KFz3MXnqaaXWnB9AgV3qqLiTfOSea+lxyztPFz06KFhiszZiroBZx5nPxq51wD3OPbfp
         gL4Ji8vith2hJZ1lMtQcHj8CRnmDRVQsbNxHK23mOvDwEpsvCJbWCtG7wV3tu3dL2S08
         hJpg==
X-Gm-Message-State: AOJu0Yze0J27Q96GvwKTHT+f5LuOYthuW6h54AW3FqzTlBkA+Tm7EV56
	2UaqagHBdCdf5x6lLWWaSJ+lRUBHWfFAj1Q3eZzVPh0pGfHh7xHphkMmUmGCgg==
X-Google-Smtp-Source: AGHT+IHLa4EleWxWB4aWYmNp5Pxbf7TYvowjhkT/jISbRpzC9TDfMJkRURhWhM15h/ie9fU/KEz0Jw==
X-Received: by 2002:a17:902:ce8c:b0:1d9:ad4e:5614 with SMTP id f12-20020a170902ce8c00b001d9ad4e5614mr3729345plg.22.1707137031766;
        Mon, 05 Feb 2024 04:43:51 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXqxKrrOOC1TLus92OFqpmNoijAw+4SbvJnb3g0IEzTExMM18K+Bqe7HV+RwkeaozVkE6m8jD6A3/zID2rOqgoFjArb0pMkR6tM4A==
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jx13-20020a170903138d00b001d5f1005096sm5099449plb.55.2024.02.05.04.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 04:43:51 -0800 (PST)
Date: Mon, 5 Feb 2024 04:43:50 -0800
From: Kees Cook <keescook@chromium.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the kspp tree
Message-ID: <202402050443.D1A3D9676@keescook>
References: <20240205161446.4b0c90fb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240205161446.4b0c90fb@canb.auug.org.au>

On Mon, Feb 05, 2024 at 04:14:46PM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp tree, today's linux-next build (htmldocs) produced
> these warnings:
> 
> include/linux/overflow.h:97: warning: Function parameter or struct member 'var' not described in 'inc_wrap'
> include/linux/overflow.h:97: warning: Function parameter or struct member 'offset' not described in 'inc_wrap'
> include/linux/overflow.h:97: warning: Excess function parameter 'a' description in 'inc_wrap'
> include/linux/overflow.h:97: warning: Excess function parameter 'b' description in 'inc_wrap'
> include/linux/overflow.h:142: warning: Function parameter or struct member 'var' not described in 'dec_wrap'
> include/linux/overflow.h:142: warning: Function parameter or struct member 'offset' not described in 'dec_wrap'
> include/linux/overflow.h:142: warning: Excess function parameter 'a' description in 'dec_wrap'
> include/linux/overflow.h:142: warning: Excess function parameter 'b' description in 'dec_wrap'
> 
> Introduced by commit
> 
>   6ad835d8849c ("overflow: Introduce inc_wrap() and dec_wrap()")

Eek, thanks! I've fixed and pushed this now.

-- 
Kees Cook

