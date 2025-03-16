Return-Path: <linux-next+bounces-5799-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B19A637A7
	for <lists+linux-next@lfdr.de>; Sun, 16 Mar 2025 23:06:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A4A393ADF6B
	for <lists+linux-next@lfdr.de>; Sun, 16 Mar 2025 22:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09B1A1922ED;
	Sun, 16 Mar 2025 22:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b="K5uSbpnQ"
X-Original-To: linux-next@vger.kernel.org
Received: from submarine.notk.org (submarine.notk.org [62.210.214.84])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E442F20322;
	Sun, 16 Mar 2025 22:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.210.214.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742162755; cv=none; b=DgEBm6KGQ7jv0woK92o4l3uL152ze5h/4fr06gPrYG2uaogDEb9q4+16HnMFSqwiq/3d83xm0yN1zInYmhKhYjno9JHgR/pCAAYlT1qAoOnq/6UayUtqcgylQuUT6MOQ79NYbl2PYRyyEby0dmHubHXLgLHXNJ4gDFLTAqVddLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742162755; c=relaxed/simple;
	bh=4YQB9O/l4SnD/+FoCa2+ROiK738rGwWx+wZu4Xqsx4I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UAH1y5gk32HcArqluSgnCnPXhHylVCKfEEX5ifs9KG2gh3CKhgOI0URI7YGl2gy9bVfHo1lNkqQuDM33xHAQyhCi5qNhgDe+IpC4/jik4c/nwFh+QWMIN8fjgx912QEX+S/XD5N6wsEVbAm5vup1A5vapGjz+RDqXKZ9YkdxF5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org; spf=pass smtp.mailfrom=codewreck.org; dkim=pass (2048-bit key) header.d=codewreck.org header.i=@codewreck.org header.b=K5uSbpnQ; arc=none smtp.client-ip=62.210.214.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codewreck.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codewreck.org
Received: from gaia.codewreck.org (localhost [127.0.0.1])
	by submarine.notk.org (Postfix) with ESMTPS id A7E7A14C2D3;
	Sun, 16 Mar 2025 23:05:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org;
	s=2; t=1742162752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uzvQtiLYOOAKkvimXIM4DAqvSSPNecA7UynsyQMLLVM=;
	b=K5uSbpnQ+5UF4uaB0IxXHa+A9hMHJquiEu/SqIKOXf/wUwiqRiVqO/UIHx78JrNCQH7yaz
	Yh/wEgu88NPuhtuGwkUwbfZj/5BqUO0lreg03m1WtMPEkPig0W+z7NzhmLTWzi3KLulkxJ
	v3yl4aTWc0Gxfcp9QFniVDU1LBGzSkYnwkbfWzgdcG7BukcMDtCkEGw42L9XdWfBDATQXh
	uF613yq6sfWSNtQruVmR9biwyXLcQzC9W7oO+6H1mSv2TCTOnWCa5gubhCtSylEWW7k5oG
	1Vc/Jpo7HjSVxxfdyXSx6WI4231bnK8h0HrWOZqWTRgHqNxZEV4gDC2MbpAyLg==
Received: from localhost (gaia.codewreck.org [local])
	by gaia.codewreck.org (OpenSMTPD) with ESMTPA id 8cda1c83;
	Sun, 16 Mar 2025 22:05:49 +0000 (UTC)
Date: Mon, 17 Mar 2025 07:05:34 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Christian Schoenebeck <linux_oss@crudebyte.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the v9fs tree
Message-ID: <Z9dLLvafxdnN13al@codewreck.org>
References: <20250317090001.2e111aeb@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250317090001.2e111aeb@canb.auug.org.au>

Stephen Rothwell wrote on Mon, Mar 17, 2025 at 09:00:01AM +1100:
> Fixes tag
> 
>   Fixes: dafbe689736 ('9p fid refcount: cleanup p9_fid_put calls')
> 
> has these problem(s):
> 
>   - SHA1 should be at least 12 digits long
>     This can be fixed for the future by setting core.abbrev to 12 (or
>     more) or (for git v2.11 or later) just making sure it is not set
>     (or set to "auto").

Thanks, I've amended that.
(Also changed single quotes to double quotes even if that probably
doesn't matter, that's what I have in my pretty.fixes entry:
```
[pretty]
    fixes = Fixes: %h (\"%s\") 
```
)

-- 
Dominique Martinet | Asmadeus

