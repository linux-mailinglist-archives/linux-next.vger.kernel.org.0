Return-Path: <linux-next+bounces-3423-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A9395F113
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 14:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA85E28C6D8
	for <lists+linux-next@lfdr.de>; Mon, 26 Aug 2024 12:15:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CFF81714A3;
	Mon, 26 Aug 2024 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="suXIum8p"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE2016F82E;
	Mon, 26 Aug 2024 12:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724674394; cv=none; b=uwk5kuegPvCjKA5hEk62Js0DvBF/RHco6eAZSBgp8F6u34SsQCAMwyqRLMTtLW33ySKLrWRpnaJT/ZQrHrIEMOitikXbhInK0IE1MqAmo53AH/B/0j1sjvPUi8uqJOKZewo+VB2Ycul7Zlp6ooBBQxRnhvMvumK4syXNHwXK4A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724674394; c=relaxed/simple;
	bh=VqPXb/iJKxAxcYQcGM7DxBnkI6DWaYD4rIvc6auuApw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T8dA3Ityqa9nwwTOACLosEwbfQHIiMogndqcKACCMJdAe5lmkljfRwuIG1WZV3WSFxs49y9mp/n25cMpJQT284bckSQ27Z/XHdMBR4tqcCUOFwmMPcJeYSf7+9OyAhB2OOL8FyluSD6d1KrcG7kskVLz5cojaRYloP7GEMF7/Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=suXIum8p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 470C7C4FE91;
	Mon, 26 Aug 2024 12:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724674394;
	bh=VqPXb/iJKxAxcYQcGM7DxBnkI6DWaYD4rIvc6auuApw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=suXIum8pRPMn6lXk3jW36FEeFIS0DVn2Tk0z5nvbMM113UAiWXraTPiofVUkO8kM3
	 n/isXhjJ3X2Jtax1Hq6jI1OR/ksgFDNmOtdUIjmtezG2aAhbyh3/jxf8htbGY3TQUU
	 Etua5LKKRn0w9NQMPiJJlKUgMvj3MgGUPLj9aaMUgOAI8y3ntwyMHHfgL1FCpye6Lf
	 wZF9qU6oSRm1aPAgT9bOZD8Cx4wJSEkQ2OfkYidXSYubVGAPkyrmsEgd/PHTiYj4fi
	 dVhmwe+94wZY42z7uX8NMdUSQCwJCO3NDPkNGdnZ1Za33gP4erNyE1nvRk+uhzXyZO
	 cQBFtoCU/StHQ==
Date: Mon, 26 Aug 2024 14:13:09 +0200
From: Christian Brauner <brauner@kernel.org>
To: Konstantin Komarov <almaz.alexandrovich@paragon-software.com>
Cc: "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: duplicate patch in the vfs-brauner tree
Message-ID: <20240826-gehweg-dreht-40e0e6bb6990@brauner>
References: <20240826082448.557c2c3b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240826082448.557c2c3b@canb.auug.org.au>

On Mon, Aug 26, 2024 at 08:24:48AM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> The following commit is also in the ntfs3 tree as a different commit
> (but the same patch):
> 
>   c4c9c89c8c8e ("ntfs3: Remove reset_log_file()")
> 
> This is commit
> 
>   3205fe852665 ("fs/ntfs3: Remove reset_log_file()")
> 
> in the ntfs3 tree.

Please drop this patch. It's part of Willy's work.write.end series
that's been in -next for a long time now.

