Return-Path: <linux-next+bounces-6469-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D06F3AA4ADA
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 14:17:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC1109A2E92
	for <lists+linux-next@lfdr.de>; Wed, 30 Apr 2025 12:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF812233128;
	Wed, 30 Apr 2025 12:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="f/h49cYb"
X-Original-To: linux-next@vger.kernel.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D76125A2B0;
	Wed, 30 Apr 2025 12:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746015438; cv=none; b=nAD13Rk7e3VcWT6fIbkFjhkFKc9SJ7R+TxXM/jtwuL90A8KuWSvN1ktMCQ+B6h7HaBFrUvd3FckhS5qKn1CetbOZkVEyOb9UcAz7KvPhubMoeIE5cTpzxMc3HJqAoSdafpyBl9/I4GAKc8j0IIHIxMojVCxMVhHXPbEEJqxaubw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746015438; c=relaxed/simple;
	bh=0/lwsBFQEL74aMsIjzB/hLaLxe+NzQ0+al5uNBu78dU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tftd80eS/n+8Vsw2npwbjrgKegs/i0vSmufRd+xkDUQU4g0twdD+7kWIOPKipBPZYPufkBuNhfsOnXxTCeMttoc0cZ+aIvDB4qbwLDpuacW7MtY3P3kWH2Ql1U058RD+qzZjizAyFYtfa06tDVB4OdcMfES6sqvZ60RGNnggoP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=f/h49cYb; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=/CruT1hpOjH0txkNMdrxLRuELIojffklxleNRgp0XsY=; b=f/h49cYb+HraKzSuBwxpbNYNZO
	LQqSSy6Qqgu+G2htxmIyqhmxIPXWmCW3J5M6kpLKMWNoX1zj+PXkgIAYi0yTyWrJyQQZsfNd+b4FM
	hLbFZqK3GZfbqojFGBME+CWLvhF9sRZklG1rvv9wxHwi4YVwmbzhZMC8rBycZKi8uCSqwidBOSXYD
	yRZceAW5f5v+S9Tqh0hN8iF/3Yp7oAnKDQ/TsjWrVsqK/DBLmk0VKGgZQ/hnYBPn1YC3G07Rh8lBW
	xpTWTu3JKXkwiSRk5mkUpR8z+j6zy4JzqqFiaBY5ujjGuYqPJDCbvAYZOX6Kqo5y1B3vZSqS1wLRO
	0IR8SURw==;
Received: from 179-125-79-234-dinamico.pombonet.net.br ([179.125.79.234] helo=quatroqueijos)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1uA6MF-000sDI-BL; Wed, 30 Apr 2025 14:17:02 +0200
Date: Wed, 30 Apr 2025 09:16:56 -0300
From: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Greg KH <greg@kroah.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: build failure after merge of the char-misc tree
Message-ID: <aBIUuIVJvdcUm9yz@quatroqueijos>
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

Hi, Greg.

I have a fix for this one. How stable is char-misc-next? Should I include a
Fixes: line referring to this commit ID? Or is there a chance
char-misc-next would be rebased or the commit dropped, making the ID
invalid?

Or would you rather that I submit a v5?

Thanks.
Cascardo.

