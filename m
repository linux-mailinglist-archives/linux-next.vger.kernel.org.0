Return-Path: <linux-next+bounces-3171-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6180A941434
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 16:22:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E1115B25157
	for <lists+linux-next@lfdr.de>; Tue, 30 Jul 2024 14:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44AB619E7E4;
	Tue, 30 Jul 2024 14:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FktCc4A8"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AA06522F;
	Tue, 30 Jul 2024 14:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722349352; cv=none; b=WmJro6Y5CYtFV2Nx9aZv2cZZWlcsZ53Wh57GS53FKNkCj+TTzmqSouzcv1/21TuaL/jnP63J1NdTxunqk03TZnTsSahOFykfp8rSyWBUqH9PeEp5AY75ov1U/dakUf1phLZ7Nt36AxhfCmj+WAw0pfUaBhdmpmEg2xxUidW6w04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722349352; c=relaxed/simple;
	bh=yop46gmMX8Wdchc8JcUWVEoyhSZVq/vUBSHu36mKwd8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ik+RbXSRP+bYycWstWUTiAK8yFVhf39EkjESJ0Lq7D+S2RKFTtuPF7mfzPHXPciCBaFquUIbAZmt40VKqoLFKx60mHysltK1zF/5xNndcsYhxCoKjAw4SuaCsUiJQHosdBURuQPmqnkrF9vn/Zq5u5OV6965u/mucJDVzQFu2OQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FktCc4A8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643CBC32782;
	Tue, 30 Jul 2024 14:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722349351;
	bh=yop46gmMX8Wdchc8JcUWVEoyhSZVq/vUBSHu36mKwd8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FktCc4A8b6nhHp2rh2AEHvuWWOHHZ7o2s+5+nrVm7F/yRp6sH7XTYV1k8f3TxXqev
	 mgtZYt4FFOGnr9SEzBaIDRHUiUfSC2ZuWgi0y4XU0U1RnB7eV1rteYBqCx8iGfjjTL
	 GCKc82EUXneeIrjSjcLSTaOl+4a5ePNA9zYvmXZeL5/Umx9ODgWXx6EdTvkiKGEGrF
	 U3xGiXhrQsAIdoA3VlYG3Qot16WcqlndJjXpCLGalTPL2BtJlLG+COaCv0Nd46M3HA
	 VV+vR3AVtpgs7dGvBYLCqcNOZM790BqGLpz3ipkm1mFcidcSCgt01ORx8OYhyCsP8a
	 XC61cYfBt3T+g==
Date: Tue, 30 Jul 2024 16:22:27 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Signed-off-by missing for commit in the vfs-brauner
 tree
Message-ID: <20240730-utensil-schalldicht-ba9808c885ec@brauner>
References: <20240730230535.593a97fd@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240730230535.593a97fd@canb.auug.org.au>

On Tue, Jul 30, 2024 at 11:05:35PM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> Commit
> 
>   70c3cb72ef93 ("netfs: Provide an iterator-reset function")
> 
> is missing a Signed-off-by from its author.

This is now fixed.

