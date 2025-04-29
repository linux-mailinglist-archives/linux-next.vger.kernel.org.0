Return-Path: <linux-next+bounces-6437-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 576FBAA090C
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 12:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 963E81B65F81
	for <lists+linux-next@lfdr.de>; Tue, 29 Apr 2025 10:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76AFD2BF3D1;
	Tue, 29 Apr 2025 10:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="mjt8FXMC"
X-Original-To: linux-next@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991392C1094;
	Tue, 29 Apr 2025 10:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924316; cv=none; b=SCwe1rE4SYvWdOq81/jAW7YndVLKEnctoRfe9r1avikuWVZ9Lz+DtO5R90ZTG5zoU16EeN8pYmuURft6Eqh1tRcnA9gpmqAnCoIS37/zf9ITcrQKe5Ckv5hqBtBb7h8xHKcrYZWiU1Lg+O2Cp3qkVIPRFP8gI2DaI3YSFIdGqZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924316; c=relaxed/simple;
	bh=sZtYlDyCf9LBR0wpfPows2BaUT53GO7cWkMRlRfjanI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFJcznxo0edhr1m9P+yujoU53so+RJFX4xZB4OgWjm3CzJfQHw0hpXf0iRYyY8GcuMKBGH8J5SJJH6/EzoT08pOo32P7nSO6zMlZOl4RGLqLM1aHGY5T+G7XH3/dUWwh+6xU54ULoG3+7wNjwcyxExohf0WDvVDBMVCiLitxWQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=mjt8FXMC; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=+ZwTtt25w4JfIxZTiE/CfuZUa15Rpbc/gd4V1VkSgIU=; b=mjt8FXMCYVjHzw3AZvQMRj4jMj
	FXipMu7G8qDmdwzIGHKTJ2+XlJOfMJA75kddgC93Bn2TqKjgXDAdFHcOhGIE5nXyBg2Uz1QDU9EeD
	wcKVqTWGOkbfBw9nms6TQ1PhoD1Oi62W0tJAowKGxiMhP9/7F2FC4blMlJ+TvKrkqp3z8jOzMO7e4
	iFqTok+/UniruKVR4ZCmHj4WQEhsPGNSiCE06GuL7DNjUkkhKZ/L+2lEbOQfPawDurb9k7Xij/Z/T
	6aCthcOjcSvMHUfyb3yrLNiBe8E53Uzaz+MtRUrrlRfuCJZ1YVjrDxvzvLpOGSVFyuNvnM53c3VGq
	fvEqQoHw==;
Received: from 179-125-79-234-dinamico.pombonet.net.br ([179.125.79.234] helo=quatroqueijos)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1u9if5-000HM2-H3; Tue, 29 Apr 2025 12:58:19 +0200
Date: Tue, 29 Apr 2025 07:58:13 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <aBCwxfksf8bCqPwz@quatroqueijos>
References: <20250429155404.2b6fe5b1@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429155404.2b6fe5b1@canb.auug.org.au>

On Tue, Apr 29, 2025 at 03:54:04PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the char-misc tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> ERROR: modpost: "init_mknod" [drivers/misc/misc_minor_kunit.ko] undefined!
> ERROR: modpost: "init_unlink" [drivers/misc/misc_minor_kunit.ko] undefined!
> 
> Caused by commit
> 
>   45f0de4f8dc3 ("char: misc: add test cases")
> 
> I have used the char-misc tree from next-20250428 for today.
> 
> -- 
> Cheers,
> Stephen Rothwell

Hi, Stephen, thanks for bringing this up.

I fixed a similar issue, because the functions calling init_mknod and
init_unlink were not __init functions. But it seems those symbols are not
exported, so I might need to restrict the test module to be built-in.

Let me test that and get back to you.

Cascardo.

