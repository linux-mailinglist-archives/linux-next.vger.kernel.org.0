Return-Path: <linux-next+bounces-9224-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C446C892FC
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 11:07:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 7586C34F6C2
	for <lists+linux-next@lfdr.de>; Wed, 26 Nov 2025 10:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C10A26ED4A;
	Wed, 26 Nov 2025 10:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kBoV8OVQ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FF32F7ADC
	for <linux-next@vger.kernel.org>; Wed, 26 Nov 2025 10:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764151674; cv=none; b=aYR0qBDXHBZT1KNPzQmQiAg7JGh3xwS3BuWlU3ucHK7w7olVxJTj+lrVUHvqOU9jiLoPcCTTee7UegcAtAb7gGDjWU/msOvcS8u2G/NgeMZNaDNXFn18yl4IOiIm/DK5VOvLuTsabW3qTV7jk+wVKWfdZ4G0XVxvUyXEMErAhQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764151674; c=relaxed/simple;
	bh=3WagWW5Hbvd9BaJJPfrHVO7PG85B9vBBzjegpadUMwU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fifXaNMTRPIr5TD7UkmTqAlMt2aL6Cx3uvehmQrOYENIIGiA7VeKUF5OE5jAOrX6fi2zgyBo981TbV28RasgYTUN/gntI+KFXaAshOLwMuBAA41XFgh+K8WeqJUg6DJIUxD2enmTv7RmVdVMHKyFRDxe2av/cPAc7hQfx/a6i7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kBoV8OVQ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7b75e366866so3046615b3a.2
        for <linux-next@vger.kernel.org>; Wed, 26 Nov 2025 02:07:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764151672; x=1764756472; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D5RBG4tougj0XhISMfRcMcPAsB5cx2PlFcKKBI/jTmg=;
        b=kBoV8OVQm6fstueChVOjjqdXU899i5Iz7YDAmuxxZ9jH5NV+OflssMU5mVuNviSHxt
         7lE7+Cwam3xUvYMP7KAAeUxyHDaqYZYzRXtwIsvbKIdtoCvJxAtkKL07hTQgk7Mem0pr
         igaxZX3aWvXLZcd1+4b+YzNGPu2yWYOpQJoBa48XAD0ZMUxGn8+Qqz4IBhGCkz4f9cOh
         XHZ3ewi6qRLRJVWmO+k0fdzHUVfbEHR8Tqdf2E0a/tM8n/ZL8y5FNQv8S+jJECeKFi8J
         LB1it8VwE4gkPBaW3V4rxM/58CQ4BUFLiHpXFmKYtL+glD1mQE4AgMYoAWbcM7BKaQdu
         4jmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764151672; x=1764756472;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D5RBG4tougj0XhISMfRcMcPAsB5cx2PlFcKKBI/jTmg=;
        b=Exwao0SDqKPTSa5ygXlQ1Rrk49ih8iGcC0W6DJSVAZvhcxNABql2T+y/AYAMAdAd2r
         FIIivD9HQtGxBW9ks20Trz/si5QPaC1UAGm9MUPbuZJmjiA1qgscGTOz9FyNK3TAKf5d
         2QI62yo9i0xfdSrLA32fN1IMvyVXwo5cV+NkCE19UogYBPccsW3rzsnP8BWTcgpA1juE
         LSpUQidOYb4QSAgItnGqObks2KZwWrt4KXKXI1jQ2M/YubeLAYk8TYWwKm/E9MNAIEMj
         qBakFhhpyn1MUJtWpHP1MdRparaKLSnqtUt7DlPA8ykIrgjEg/X4E8ZPJUSkw0LkGkWl
         EX3A==
X-Forwarded-Encrypted: i=1; AJvYcCXVBNUVfQ0unapP5Nu7U+FUZN+qyj+GmFNwDaeUa0h51bKUn9ADEXFleNhdw22ZggcZZT0G2Pni5Hb0@vger.kernel.org
X-Gm-Message-State: AOJu0YyBf3m0iPUsKrIWg1t02HcMCxa39oG7+Gt0+dp8SCzVdNtgytaZ
	s90wCmUQE/nqdDwsXBP74OYrmlRieN/FBrOXgC2MHxsl5bUs76ZRWtcf
X-Gm-Gg: ASbGncsXEnM/tKTQ/xaxlGj97FlBQ1vXh9HRHeGbqM8hhfX/WnBRJUTICKtO/FMnZ8d
	pFKtKMs26m9/IlPzkWGRlTczaSXh/yK60qwNK/fkkKraCYFXliRkMfawyZyqQspNfGshbXLgF69
	mp5O0mZ76k+kKbEPjala1KIU2L5gAH9OEP6Imo5go5npjgggSo2A0diVH1B0D4YWfuynMH/Q66U
	hvD1oKUBnVHuB2V+uvlnlRF6bVWqy0ry+92jN+A4sNguR9CFP7W3C1Q7U8iBlQqg/e7IuSwXEl/
	fLCCAA+Fziao1zivRHuSBNVVehlwBznSRnLMXf0ucrrHnZVBisLyxr6sLPNc/8ri6s2tqPrK19l
	hLFkly6ry7Rbx7+hGNfnC1vmsTPcEbZVCsOuKzIrc3o9WPulwuXUBFZH96FdPWbSrvCWiMoyb6I
	Y+iEGxLgG6QKm+hw==
X-Google-Smtp-Source: AGHT+IFRTuczlH2/yxOabhpWAHgWQIuoH/cix5GuSxIlIIYSGfB6/C3FvDUMDLWDGmWk8TvSBRfD8g==
X-Received: by 2002:a05:6a20:9148:b0:334:9b5d:3876 with SMTP id adf61e73a8af0-3637daaf589mr7081618637.4.1764151672545;
        Wed, 26 Nov 2025 02:07:52 -0800 (PST)
Received: from localhost ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7c3f0867558sm20959917b3a.46.2025.11.26.02.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:07:51 -0800 (PST)
Date: Wed, 26 Nov 2025 15:37:49 +0530
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Bagas Sanjaya <bagasdotme@gmail.com>, Ivan Pravdin <ipravdin.official@gmail.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Tomas Glozar <tglozar@redhat.com>
Subject: Re: linux-next: manual merge of the ftrace tree with the jc_docs tree
Message-ID: <qqfm7m4szknc5vxfngm7mhbxilai26wsaujttzvbqj4t53qfpe@yqx4jcruk2dw>
References: <20251121123509.5f07d818@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121123509.5f07d818@canb.auug.org.au>

On Fri, Nov 21, 2025 at 12:35:09PM +1100, Stephen Rothwell wrote:

> Hi all,
> 
> Today's linux-next merge of the ftrace tree got a conflict in:
> 
>   Documentation/tools/rtla/common_options.txt
> 
> between commits:
> 
>   96b546c241b1 ("Documentation/rtla: rename common_xxx.rst files to common_xxx.txt")
>   198fcc7cb832 ("Documentation/rtla: Mention default priority")
> 
> from the jc_docs tree and commit:
> 
>   90241d14a726 ("rtla: Fix -C/--cgroup interface")
> 
> from the ftrace tree.
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
> diff --cc Documentation/tools/rtla/common_options.txt
> index 1c4f3e663cf5,edc8e850f5d0..000000000000
> --- a/Documentation/tools/rtla/common_options.txt
> +++ b/Documentation/tools/rtla/common_options.txt
> @@@ -46,9 -42,7 +46,9 @@@
>           - *f:prio* - use SCHED_FIFO with *prio*;
>           - *d:runtime[us|ms|s]:period[us|ms|s]* - use SCHED_DEADLINE with *runtime* and *period* in nanoseconds.
>   
>  +        If not set, tracer threads keep their default priority. For rtla user threads, it is set to SCHED_FIFO with priority 95. For kernel threads, see *osnoise* and *timerlat* tracer documentation for the running kernel version.
>  +
> - **-C**, **--cgroup**\[*=cgroup*]
> + **-C**, **--cgroup** \[*cgroup*]
>   
>           Set a *cgroup* to the tracer's threads. If the **-C** option is passed without arguments, the tracer's thread will inherit **rtla**'s *cgroup*. Otherwise, the threads will be placed on the *cgroup* passed to the option.
>   


LGTM, thanks
Gopi Krishna Menon

