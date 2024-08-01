Return-Path: <linux-next+bounces-3203-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC2D944D50
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 15:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC30A1C23FEC
	for <lists+linux-next@lfdr.de>; Thu,  1 Aug 2024 13:41:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03E121A2C05;
	Thu,  1 Aug 2024 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YAWRjLpE"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE251A2C03;
	Thu,  1 Aug 2024 13:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722519681; cv=none; b=lEGndvMuNzFeHY2QAry2X927Nd/AfvNYOE66iZxT9n8i82NobBWr2hR/8PFo/Ln3fMn+Wka0yIyK1xk3iZhjqES5LBVaFfRMP3Rf2zpITyu3XqkCCTAmT23pPKp8xEhWLUyra3yrIcOOmYYFouAluPTfJ5TRVVeoZC0rJOU6Eew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722519681; c=relaxed/simple;
	bh=ITSlnM//JXWZbNv+5O3iKsTt/37WmGTd6mAfy47QL9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P3itpHGbWdI1nO3E1OA1sE8pkCcOSk/ZXYZAxtZd4QUiFvQdMYHrsh33UzKfthX91pPip8p7SSUoVSU/p/DQoCRDO0aPKMgBMgeu/TULbsPvX1FrQuHkwAsjOsec8nfMEbnTd5bNnOcVoZBD5GoBbVpsHMHKo/Q8eoD9/3KiEP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YAWRjLpE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B55C32786;
	Thu,  1 Aug 2024 13:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722519681;
	bh=ITSlnM//JXWZbNv+5O3iKsTt/37WmGTd6mAfy47QL9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YAWRjLpE2AtZ487i2HSn8wuL28F1RbVeox6YmrYa+bfPJ1lakcorPSv1DkSwQ4GJk
	 8ERXaMIFhddkS3iyz19N9uWsIhTDDOUbTseLOItEC2P7xJF30aXKVh+D+POxFsas0a
	 +uE9MvPypKFxSdjsSIJZlINF3kQLv7CZIaEHD2FOCBs5Wvi61fEW2WTpMw2opBvJ0G
	 Xp9F0j/lVkS8zSJz9lxgfF187EtqPxAutaKCeABe8/t14IeqUTa789Dfh7vHq3cWr0
	 fPjFivnLEc8VnWOqW6a2fRPAAs8Sp9kkn55sV0LVtthwwo3hffIkrijv/KtneCYfjf
	 nqvBVSC7Owmpw==
Date: Thu, 1 Aug 2024 15:41:16 +0200
From: Christian Brauner <brauner@kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the vfs-brauner tree
Message-ID: <20240801-ergriffen-angeordnet-48c4b735c5c5@brauner>
References: <20240801150113.4826dc18@canb.auug.org.au>
 <4137944.1722518494@warthog.procyon.org.uk>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4137944.1722518494@warthog.procyon.org.uk>

> Documentation/filesystems/netfs_library.rst:.. kernel-doc:: fs/netfs/io.c
> 
> That needs removing too.

I've removed it now.

