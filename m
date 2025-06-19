Return-Path: <linux-next+bounces-7184-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0D5AE0D14
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 20:38:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 372A97A6FAE
	for <lists+linux-next@lfdr.de>; Thu, 19 Jun 2025 18:37:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 482CB23CB;
	Thu, 19 Jun 2025 18:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKNrBTw1"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B8F17D2;
	Thu, 19 Jun 2025 18:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750358328; cv=none; b=rvFvLtHZ2JLTJY7z+StVPL1gn08Il9X1U69/lQgtUFyvz4qdpz2wgbysGUnzCc9pW0EbV2HoSj/tlsWPnZzQMtELSL9o+7CjA4FTDaqh7SXBGJ2iTB239LN2zFVSqgjXf/3HEum5IlapevmX18jjKNOua9RilPFEwwx5bDkiOHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750358328; c=relaxed/simple;
	bh=TH15rgK6XjywQeouifyrUdmXirqEGrt8mFBxsrjpTbs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mVGM9TPFKG4dsOTZ+ap4lwsIads5KcQRbM+EIjkzNyEN5esRqfvRj6Sz82LFqRcHoHfH8ULhTeEQ9JvQzJixbdCvxggwkzdZ4GUMmyohUPs5RMUJ3OIzea+AaDfsPXe81M9EmyTIZzauHUCNz4YQSVs/uHyhChVkJL8OT/v1RoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKNrBTw1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DFC2C4CEEA;
	Thu, 19 Jun 2025 18:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750358327;
	bh=TH15rgK6XjywQeouifyrUdmXirqEGrt8mFBxsrjpTbs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKNrBTw1RyPk7CmbxNkbgcwzowTx8KRZovK931AWBMU3gj8zbeOoXA3owRmZZb3up
	 Bp5Q60e3tNOpXAF5lDW8+wtGX8fY2leenfU2RY/IaUov7c+y5sEez9Wz5Vo3AQ8M00
	 ZB0oXl9spn424CnQej8rD9wR4nYEJKC9hyEBqa/BkWdB233/WPLi+5UEgyDlgcIgfw
	 AB/4Tc8ugXw+krDvRFVR4e/GTzOvkXCIUHXeuCNEYoncvANqZxn/MgrUbC0ZPUEa9W
	 9hjVLnqNl0JQJ+RH/Gz4M64IxnNT/6A3xWXHRHYipYgqc3raT72fqQhttm1WCCiz5e
	 gNB7GQWQXAysw==
Date: Thu, 19 Jun 2025 11:38:16 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the crc tree
Message-ID: <20250619183816.GA100715@sol>
References: <20250611142832.1e151978@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611142832.1e151978@canb.auug.org.au>

On Wed, Jun 11, 2025 at 02:28:32PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the crc tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> lib/crc/crc32-main.c:1: warning: no structured comments found
> 
> Introduced by commit
> 
>   3eee6f3d771d ("lib/crc32: remove unused combination support")
> 
> -- 
> Cheers,
> Stephen Rothwell

Fixed now, by
https://lore.kernel.org/r/20250619183414.100082-2-ebiggers@kernel.org/

- Eric

