Return-Path: <linux-next+bounces-4048-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1796998C12A
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 17:10:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A45F9B24946
	for <lists+linux-next@lfdr.de>; Tue,  1 Oct 2024 15:09:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 841631CB51F;
	Tue,  1 Oct 2024 15:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pD4qL3g+"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5399F1CB517;
	Tue,  1 Oct 2024 15:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727795138; cv=none; b=YE4FO1kJVWcWIQgI3/IqEh4R4gPeVzbyBR3yayJ5ir0d3MCLNabe4iL3qhHGZpRBl8xc/loXyQ+gx6LhNbiLKB2xXw1lqYFC8e2gThMXxJsOV1IV214zFtuDIHG3ueIqCFak5aiMUnvDPPE4Uh8rc7iRbCcedSYGDzG7a4PviXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727795138; c=relaxed/simple;
	bh=FaZcPbos4DhkMxNk9rps0M0VXnVgZNKNJn7wNnUBlQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j1Tv5Tx1oGVbAKH+dKHqJGiapme3FHl41pJh8ljNDtKkhfcR+v85xLrq4rEgQ9at95XfRDrTNQSsiw/VnBHeE2X0sRts1d8cE2hczS+svX5XoI3YneX6PqsUwRmdHzQPMQPvjMBCfgqOzVIMtBdEDAVCh4ApZ35A7sVkgqBbpg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pD4qL3g+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B4DC4CEC6;
	Tue,  1 Oct 2024 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727795137;
	bh=FaZcPbos4DhkMxNk9rps0M0VXnVgZNKNJn7wNnUBlQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pD4qL3g+Dr/m6MzJ9tSZUsayBGoHJ+w78ErXjExKjXriaHF+1t2RVKDUcGk7XDn/3
	 4WF5KqxJrang+bwnDS5eDWSjgk44d08QRw0H8IK5QviTnGote/er8kv6eIgmDGMQYT
	 bhc317nZEbrWhNMqfrfp+eP4hi3ZTGj9HDu6G701lEOPnRbl+donZBJapkE5uqvB/T
	 5+Obgyyly3sWi7dtEEO1VY5c2R00uFWCGtnQ63fsFJz01gM4rW+gTxl4XZytang48C
	 iCmkYVMbaMfHDW+lrNuNM9UeQ4s8A6O50wBzdM6V0t4ZM+ak6e0KkRvWOdzPKc82xj
	 CpSWIPLMOSulw==
Date: Tue, 1 Oct 2024 17:05:34 +0200
From: Christian Brauner <brauner@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Howells <dhowells@redhat.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20241001-epochal-happig-abf4f1c1339a@brauner>
References: <20241001133920.6e28637b@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001133920.6e28637b@canb.auug.org.au>

On Tue, Oct 01, 2024 at 01:39:20PM GMT, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the vfs-brauner tree, today's linux-next build (htmldocs)
> produced this warning:
> 
> Documentation/core-api/folio_queue.rst: WARNING: document isn't included in any toctree
> 
> Introduced by commit
> 
>   28e8c5c095ec ("netfs: Add folio_queue API documentation")

Added a comment to fix this. Thanks for the report!

