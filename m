Return-Path: <linux-next+bounces-5408-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E32DA2FC99
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 23:07:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6D9F43A1E8C
	for <lists+linux-next@lfdr.de>; Mon, 10 Feb 2025 22:07:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E31524CEE1;
	Mon, 10 Feb 2025 22:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ph5cjXU9"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6603B264604;
	Mon, 10 Feb 2025 22:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739225239; cv=none; b=hd8F2a97s8DTYuuo8G2GfCzHa7wewFf6b33EOt23dC8Shy8qkMYy0s0sv4uYhjXa5veQp8Tj9WrvzjUNJAJ+FavIX3gOfGmTfRCD9ovclwNNK4Z81Ilt8yafrFRbqukQLpt/abIepdCLyDUfrksSeHwbHZnFesE4RcLXPjtgxgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739225239; c=relaxed/simple;
	bh=ZnKjEUxTzLTwhOhThWkm7CEAoD5+A2C5AYJAEYl3+2Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=D+1vVYVmObZibZ5yd2UZ2IdC12siAgJt7Z+/ptaQiqh9koxl5dErpjVduOS7CYPai3pDDntaKqSmHw2HVCPJ4SdsXbowWrKvqjsvKGS6eBD+1MwCB2FJu2/5kZHLTccT4NBEz2PcMgEkrGrJfxtxPuHax0pgnhJppqEF2nEDZRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ph5cjXU9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D837C4CED1;
	Mon, 10 Feb 2025 22:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739225238;
	bh=ZnKjEUxTzLTwhOhThWkm7CEAoD5+A2C5AYJAEYl3+2Q=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ph5cjXU9XTTCQjLqgVd89dWkc2T5wD8FFtPWNLMKLLG8XiQ5Yw7ctfoy+g682Mm5y
	 z35wVtdIHPC4/m8YtzHaVyYKZ0lR0n6wW/Ig7/RBFqfc+S7K1lG+b+nFzeAy7X0bOI
	 6eGkoz5RqMdG5WNFgCRivXsS3QSxWaQ6KDX+HzP1gDaIz+GJyZ57N3XtG/y7W15SJj
	 lyXnzqd+O6iRJdCKhJv620uc7mOhvqrxEnNvR0K/4YOQmWKdsZEqsJYTVE3EDUvbeT
	 AW0H8kige1jab1eqixlObCjGcaT0umctsky1oDB74Xt4lETKOtBbn+pNuor5NVGDNe
	 gq2uzu8hMkd/Q==
Date: Mon, 10 Feb 2025 23:07:16 +0100 (CET)
From: Jiri Kosina <jikos@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
    Kate Hsuan <hpa@redhat.com>, 
    Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
    Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the hid tree
In-Reply-To: <20250210104347.3d291afb@canb.auug.org.au>
Message-ID: <64504o9q-5os6-79p3-o18s-5pn6q9s0q6n7@xreary.bet>
References: <20250210104347.3d291afb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 10 Feb 2025, Stephen Rothwell wrote:

> Hi all,
> 
> After merging the hid tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> ERROR: modpost: "led_mc_calc_color_components" [drivers/hid/hid-lg-g15.ko] undefined!
> ERROR: modpost: "devm_led_classdev_multicolor_register_ext" [drivers/hid/hid-lg-g15.ko] undefined!
> 
> Caused by commit
> 
>   a3a064146c50 ("HID: hid-lg-g15: Use standard multicolor LED API")
> 
> # CONFIG_LEDS_CLASS_MULTICOLOR is not set
> 
> I have used the hid tree from next-20250207 for today.

Indeed, this was reported by 0day bot as well.

Kate, are you planning to send a fix please?

Thanks,

-- 
Jiri Kosina
SUSE Labs


