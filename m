Return-Path: <linux-next+bounces-2500-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7DB900D68
	for <lists+linux-next@lfdr.de>; Fri,  7 Jun 2024 23:19:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 173FFB22737
	for <lists+linux-next@lfdr.de>; Fri,  7 Jun 2024 21:19:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E555C155302;
	Fri,  7 Jun 2024 21:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Rq/Qlhql";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cG8BApOF"
X-Original-To: linux-next@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5991552EB;
	Fri,  7 Jun 2024 21:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717795158; cv=none; b=FgYbMXsGOmTNx1w5WEAcQyizksj5RLkqnjg0Erip8ZYDTP9Ula7zG+AgDUsBkzpVhWXU/5nFdofGvZaoIVyJ1sEwkTUPpJwfnvwJ214cnbVmBDCndyyTVw4mMZv4JLvgEzlPWy3vdnRAdoIAo7V6Fx7INIftwNuc/Pm+LsuI2JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717795158; c=relaxed/simple;
	bh=aKO7IIKd3YM3B377BMxT7up1UdC03Wd9dIaXmx36hF0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=svBoQzuxrKaOppailJSOb4whW+O1BSKHWQ+jAG1/hF05YW0ZsNvsIusBkTxrFCM9l5ahvDkwOv4LUtWHXi5SLxepzou9VISAHM5HXHUQmAojoJmijDLZ58NKuYQMA8AQwqjIN4g/Cn+Gcdi2lEV93P59vHHQzrX7rDrEP5K8DcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Rq/Qlhql; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cG8BApOF; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717795155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X4SfvODdCaU27Zfb5Q8rCjLtZ7IxwUhXp6Qa5vuMioU=;
	b=Rq/QlhqlwKecsmYIuU+eUSgUhPGlPRXDLVoE180Uq2N75yNrLROzgEtiIW5vU2OvFT3k2g
	nWXDDI8wEIyPQEnNm2kF3OBI1ggkm9lA12mGn1m4bnBxCRb2FguCIdLnUocwcP8usL3A32
	xrzvPPnEXV9ygCKIErVCbujr/lPz21BkAl7WyqQjiBVSZH/FRhPE0901PTGaKA1F1N3U42
	gbkXmnH4YGK5cDr0VrfXU/anZvyG6gFyHaU1AnS7jrn+1sXQzUk+QiTRL6rDuc53CDTF9u
	pf7fXglYxSxZR5Ci4BWuGVLXTq9MdIP0NgRmAOhY39hX9DeSdjBBqSj9W5+m2Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717795155;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X4SfvODdCaU27Zfb5Q8rCjLtZ7IxwUhXp6Qa5vuMioU=;
	b=cG8BApOFSLIDqBA5gHliu1YHSctKxDxQCb30AMVpB3H6j0WhfOIQjj35dZPq728bplVa7W
	3uz83Ng/xtSOosDQ==
To: Stephen Rothwell <sfr@canb.auug.org.au>, Dmitry Torokhov
 <dmitry.torokhov@gmail.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Yury Norov <yury.norov@gmail.com>
Subject: Re: linux-next: manual merge of the input tree with the mm tree
In-Reply-To: <20240607102417.2cc20b04@canb.auug.org.au>
References: <20240607102417.2cc20b04@canb.auug.org.au>
Date: Fri, 07 Jun 2024 23:19:14 +0200
Message-ID: <8734po1mel.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jun 07 2024 at 10:24, Stephen Rothwell wrote:

> Hi all,
>
> Today's linux-next merge of the input tree got a conflict in:
>
>   include/linux/interrupt.h
>
> between commit:
>
>   2156d61a07d9 ("cpumask: make core headers including cpumask_types.h where possible")
>
> from the mm-noonmm-unstable branch of the mm tree and commit:
>
>   c76494768761 ("linux/interrupt.h: allow "guard" notation to disable and reenable IRQ")
>
> from the input tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Dmitry has this commit tagged for tip tree consumption. I take care of
that tomorrow.

Thanks,

        tglx

