Return-Path: <linux-next+bounces-5449-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33174A35895
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 09:14:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 057F8188ECCC
	for <lists+linux-next@lfdr.de>; Fri, 14 Feb 2025 08:14:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF741221D8B;
	Fri, 14 Feb 2025 08:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b="q/+O1SlJ"
X-Original-To: linux-next@vger.kernel.org
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87161221550;
	Fri, 14 Feb 2025 08:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.250.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739520832; cv=none; b=YF+04m1MKzi+yYzXGGYV4DfRdquRIjvMnroAXl9pGpA+ur8lV0T6H9fx5AmaTjyzusPHe8XVHGA0aG4Vid6wPDggp0pB8EN52tiwLlklWKZ3nW0nsa+PhLmaf7k5h9P6CVQlsM+xJ0vfvQFOXVsCO/tOhmnUkJYoC/ruDRka4uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739520832; c=relaxed/simple;
	bh=LJiZ59p6Axmgy3TaUBc91/SHBQguF8RKPES2VLQ4O2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NUvwYAijIcaaPzrmuSzafqWtTLY0c5GGcucu3nlCj6CrZfSHkMhdAiIP0pTxCizPmGsjxKWZ6QPQ8JaHH9CDRx1pT/7bEplMPAB8ZIEe4HFJ3OeTZupXATTi6oU9OAQMb87vMzWgKu8mH1pdUWHCUA4hR0iBZTz8nYz5FW17EZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org; spf=pass smtp.mailfrom=8bytes.org; dkim=pass (2048-bit key) header.d=8bytes.org header.i=@8bytes.org header.b=q/+O1SlJ; arc=none smtp.client-ip=85.214.250.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=8bytes.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=8bytes.org
Received: from 8bytes.org (p4ffe03ae.dip0.t-ipconnect.de [79.254.3.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 823AE426C2;
	Fri, 14 Feb 2025 09:13:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1739520823;
	bh=LJiZ59p6Axmgy3TaUBc91/SHBQguF8RKPES2VLQ4O2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q/+O1SlJslEG0kGMD8QjcSficyTidI5durjKb299TXe6ygT9u2ygYose5M8dFZmZ0
	 iOeKhZ0m+um1cWM5mMBZSvM/yyW0VqMxaBWZ7v1VSrXFZezreXECj5Y4Wi9gghkKG+
	 l3x3Fa2OGSa9Dz+FgWFftVQt/wreyVZm5AmUIDKFsRp2zRSz/opRL1oto1aWG74KhC
	 6QjnpQ1qF+MbSG97eKUfHhF7pvvGAyPE+s0SZAyRlKyTGwjIWvtb7F4fR2xID3YD1a
	 Up50QUFTDQJLATbQmmkM6xWHiigzvlOYd52uTrsXWFa6Ni5iUJm7Sr8WKCl+/JFMwe
	 UZX1A/vnBvJqg==
Date: Fri, 14 Feb 2025 09:13:42 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Vasant Hegde <vasant.hegde@amd.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the iommu tree
Message-ID: <Z677NjlRfHdOmdiy@8bytes.org>
References: <20250212081251.0a1eda6d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212081251.0a1eda6d@canb.auug.org.au>

Thanks Stephen. This is fixed now.

On Wed, Feb 12, 2025 at 08:12:51AM +1100, Stephen Rothwell wrote:
> Hi all,
> 
> In commit
> 
>   a1bb25cad5ab ("iommu/amd: Expicitly enable CNTRL.EPHEn bit in resume path")
> 
> Fixes tag
> 
>   Fixes: c4cb2311110 ("iommu/amd: Add support for enable/disable IOPF")
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     This can be fixed for the future by setting core.abbrev to 12 (or
>     more) or (for git v2.11 or later) just making sure it is not set
>     (or set to "auto").
> 
> -- 
> Cheers,
> Stephen Rothwell



