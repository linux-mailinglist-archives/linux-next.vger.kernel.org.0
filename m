Return-Path: <linux-next+bounces-7488-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0687B01AAF
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 13:39:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D2CA16D248
	for <lists+linux-next@lfdr.de>; Fri, 11 Jul 2025 11:39:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7FB228C035;
	Fri, 11 Jul 2025 11:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="aMUC643m"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9389146585;
	Fri, 11 Jul 2025 11:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752233974; cv=pass; b=Fp1/667XRIcdYQLjfq6G+1X2QMob4q4LgWt+BOXr30FN9TGxYirn1mtDG6srZU69l+a2oqy+cXsjB6w8z/0EL374AAiuTO/F2qQPlUOJA7JPpr8R0fvvFxZYa5O7Pj+kj34NJd0EE+rokFqJQIOIDn+s6Zb6uAYUDTwYBnMfY8U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752233974; c=relaxed/simple;
	bh=+Yp/9vXJnuS15q7Ws402XZPZ922d6uO4iW3tyf60u1k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KLws4zGfmEl47LZXK684q26tE3EJjntSe47dFB4j/74PoybIrCFLDDv1yM0o/y+QoZwAkApUJRT3P5+51kO/mF36XU8ijSHuOI4wPs9eMcZPUo3TEneQ6rv2eZr36aEz0OdIx4KnbqsmcaT+7BjVEnxMNWcn4H5SDlGnmS/kvw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=aMUC643m; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1752233965; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Zq3U5WsnB6luMlxmGM7W7VRgJ69tLs8p2fyy6RA61sB2PJlOa/TvF14VxPmZScG6FMTkfnW7EJouMIHOwYSE7CWtdLExmgsxMjeoqkOkL8IGTTwZgtTLSDQlk9wa4XcNcSXfrS8yMIrzxIFaLPaX8a0dCCG5LDOa6mrCqsSZrNs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1752233965; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=T8MIuW08C8koONJfmm3jnIPFf9fQ9pRVLTB81egtRnY=; 
	b=mhOlr5tSbQK4sGWuQdCWwbAITTDnC3pi28On748NuiaNoSaXo+SI2DCP6wsSJchP1DWsZ26i7aHFWC54pZAE1Ix1vDsFdZXAYV79p59K0WKupydS+AGfpv4HgHGJCqF6MnohrUsJsRwvaXuSFB5ZNJn/CZRJ4JF7BA3fuleysio=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752233965;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=T8MIuW08C8koONJfmm3jnIPFf9fQ9pRVLTB81egtRnY=;
	b=aMUC643muaYql7lmeDIbbtYBj+eQxTTiHAyiS/lFhak1Rfp7izMmaexbM46fymnX
	1oKgcZ7hNpZd4/0yZrlGpi+xOMdH/1nU4c1PZCCNOc2bISUjzPi8Dg+NzJXrAHPVAjv
	GffBCZEUUE4FMW2GlVEyb+BgZqMIGBwzI9SP7uMc=
Received: by mx.zohomail.com with SMTPS id 1752233963651916.9375382365815;
	Fri, 11 Jul 2025 04:39:23 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the rockchip tree
Date: Fri, 11 Jul 2025 13:39:20 +0200
Message-ID: <3455912.mvXUDI8C0e@workhorse>
In-Reply-To: <20250711082614.69765ef3@canb.auug.org.au>
References: <20250711082614.69765ef3@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Friday, 11 July 2025 00:26:14 Central European Summer Time Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   fc276de7b63e ("arm64: dts: rockchip: adjust dcin regulator on ROCK 4D")
> 
> Fixes tag
> 
>   Fixes: tag because there is no functional change here. I don't think
> 
> has these problem(s):
> 
>   - No SHA1 recognised
> 
> It looks like that Fixes tag was incorrectly picked up by automation
> from the mail thread and should be removed.
> 
> 

In the future I'll be sure to never mention the tag by its name
followed by a colon even mid sentence ever again, since tooling is
apparently a little over-eager here.

Good stuff.



