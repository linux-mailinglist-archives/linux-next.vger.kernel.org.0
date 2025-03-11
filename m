Return-Path: <linux-next+bounces-5748-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F67CA5CAC0
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 17:24:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 66A4A177EDC
	for <lists+linux-next@lfdr.de>; Tue, 11 Mar 2025 16:24:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2801325FA35;
	Tue, 11 Mar 2025 16:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="EQzDzZmb"
X-Original-To: linux-next@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B2125F96B;
	Tue, 11 Mar 2025 16:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741710286; cv=pass; b=iun8uI/pFomutmL2z9dG7Dg+6+O1la49/FwP0tNF8+9xtJ2O2OAeenRLFhqwoH9uNoY57ZAyLroTA8YNmXGsgheIa1L5wULlljwpJH9GS+zygYja1HTeApy+Xr7bgvs3WtfODRKiVIgN8aHiN5Lo/ZmuhEITklBI0zQ12vbwL5A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741710286; c=relaxed/simple;
	bh=ZQPFXs/NyWy22DTXTmNKpcjxjvpS8UzUO5tHd2hHa40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LoA0/G2A1twdcx0tqk0hnQfPAp/LEDuJrp+/pD7R3fe04Jr+LtVnTfq8Vspj5OLgGtVNcDF5I7xUPzSLMtB5evB23lr3Wy/3pb7P1SAL4sSaa6fOcDFZgXqO0T4SDnRA9NmNtJbhekC7Df1CUnjr7L4OF4jP/+kG5xZYxqjNJZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=EQzDzZmb; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741710269; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nhmN8zyLRceHsMJBLbkdu8At1C3SedWfW8eJMU2IYpSTcMDguouxy8srFxpGKZbnjZbdL8nx930iUSqmxpjGLiVEeXAG1Djgt1+ppB2iaTKG1IZm+z882Ta1ttloC9u7L+a9no0qGCT9JYh5r9JF6qv4bfc0nTd5DAMDQSX2kEw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741710269; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=e+tVNkmJBsZ/ypMezAp+T4og4K/Paer/ZHywp9j9LAk=; 
	b=YUTBxQPaz88JyqELTg7SKC+VesfiDhF680KtbRKUiN82WeLhhkemM2pwHXkOhtJ0aueyIAT5gNd7O2JGEIc89tCFc+EjXR/7FZtTRz7GiJxrzaOqPeYew7+F8qkkc3QnG2Re4M0SwSU5vOikOAvBM3QsWddWLEj5SVO1NNdzzx0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741710268;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=e+tVNkmJBsZ/ypMezAp+T4og4K/Paer/ZHywp9j9LAk=;
	b=EQzDzZmbuzk82ZhYnMl9+P3Xk2nw5CoSxhtycSTG3HW8T5S+nJU4KtNxsiGt6bLs
	TO26UAlFlQZzYZCXw4RC3h8N0JFCSryfD/OFet0WLjHyQwDEzz1YuMfhowFMkxxAqq5
	RrABUQikIMGEeeHC9OCivwdQ5f0AaCe/RwYIORgk=
Received: by mx.zohomail.com with SMTPS id 1741710267359805.8044160209615;
	Tue, 11 Mar 2025 09:24:27 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: James Bottomley <James.Bottomley@hansenpartnership.com>,
 Heiko Stuebner <heiko@sntech.de>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Shawn Lin <shawn.lin@rock-chips.com>
Subject: Re: linux-next: manual merge of the scsi tree with the rockchip tree
Date: Tue, 11 Mar 2025 12:24:25 -0400
Message-ID: <6134949.lOV4Wx5bFT@earth>
In-Reply-To: <20250311183524.38989e83@canb.auug.org.au>
References: <20250311183524.38989e83@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Stephen,

On Tuesday, 11 March 2025 03:35:24 EDT Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the scsi tree got a conflict in:
> 
>   arch/arm64/boot/dts/rockchip/rk3576.dtsi
> 
> between commit:
> 
>   36299757129c ("arm64: dts: rockchip: Add SFC nodes for rk3576")
> 
> from the rockchip tree and commit:
> 
>   c75e5e010fef ("scsi: arm64: dts: rockchip: Add UFS support for RK3576
> SoC")
> 
> from the scsi tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Unfortunately, this fix is incorrect as nodes must be in address order, so 
ufshc: ufshc@2a2d0000 must be above sfc1: spi@2a300000.

As we are close the the merge window, I won't mind if the patches have to be 
postponed to the next cycle, but some device trees won't build anymore.

This can also be left as is with a new patch to fix the order (to be backported 
if needed)

Regards,

Detlev.



