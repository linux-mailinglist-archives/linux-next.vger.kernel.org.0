Return-Path: <linux-next+bounces-4976-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5C89F3CE3
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 22:38:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EBCF168915
	for <lists+linux-next@lfdr.de>; Mon, 16 Dec 2024 21:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06E981D5CC7;
	Mon, 16 Dec 2024 21:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="AEfZBX+i"
X-Original-To: linux-next@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A151D5161;
	Mon, 16 Dec 2024 21:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734385116; cv=none; b=RqbvqsLl+MedEvBb4saq+BC8Com7AMzK2P3bT1n8gRBwjMVp2QpmdANijBaYmhlHXpJWX3QtuuM19IMzZh+s3ZzY/hXJVWMQi/ctRWO8rkg/y5zcyeyYUpQpPSFR5tm+UrYYQJXUn9vNq6+0p19iSwm6BdPQKgc++E5uitHOJac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734385116; c=relaxed/simple;
	bh=WnPxkxQhCGq1uqkEHlBflgEQWR6HBmoZCyQfWyZPFkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBAe43oZcDrRX5x81LyU2irJQj4TARL1AnwsTq4u39jqgbxgh2tXI/wz2ibNlqSszwqbFWh+VVXh/h9Xb7mYZn5DwF/wnBinBIZFFi5CwwIYEIR9koymLc2jTDESK2Odi8BMfXFQAuKTWdfO+X1C3mYtABVpxa9afUjgWx+2JBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=AEfZBX+i; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1734385110;
	bh=WnPxkxQhCGq1uqkEHlBflgEQWR6HBmoZCyQfWyZPFkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AEfZBX+iKbZWJ9GY1loBuCgLNjFUCTPPtnrsRDwdLGckmrFpOYxTDdyNYRqFvT7M7
	 x6VOQ3NBSHOzQ5Z60Y5TMnA8yMlrNvH2eJ19cZq8qGCIhfZkm1paW7dQupTp/E2kjV
	 U0xoCyNbyMNFlWYaHWD316XjjFZYnvDznNShIF+Y=
Date: Mon, 16 Dec 2024 22:38:29 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the drivers-x86
 tree
Message-ID: <9166ecd7-7b73-4db6-9827-7e65fb06057b@t-8ch.de>
References: <20241217071748.5a05af89@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241217071748.5a05af89@canb.auug.org.au>

Hi Stephen,


On 2024-12-17 07:17:48+1100, Stephen Rothwell wrote:
> Commit
> 
>   f05a99b0d5f1 ("platform/x86: dell: dcdbas: Constify 'struct bin_attribute'")
> 
> is missing a Signed-off-by from its author.

thanks for the hint.

Ilpo, do you think you can fold my Sign-off into the commit:

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>


Sorry for the noise,
Thomas

