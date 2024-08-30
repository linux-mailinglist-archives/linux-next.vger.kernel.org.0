Return-Path: <linux-next+bounces-3512-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FAF96585A
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2024 09:24:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6BDD1B24C3D
	for <lists+linux-next@lfdr.de>; Fri, 30 Aug 2024 07:24:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 623711547C1;
	Fri, 30 Aug 2024 07:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fN35foU/"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3992C1531D4;
	Fri, 30 Aug 2024 07:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725002691; cv=none; b=hZpze+pSwZQdb2TWLq+hao0TvMdL0wBsjP2PiIjkSZQePK7oxA/r2MsfqiiGzRriRnScXbD8ETci1c/eSLC6r8B4lHQBa8gLTqJWNuzKh9i2lfCrbc1rQEYrbx817PulqTJHyj+YsjlB03ryApaLGG5M8GwN5aMhJ5hqTDGSuho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725002691; c=relaxed/simple;
	bh=T6yjIwLOMmggHigQLJYgxnquiNY/1xjA1gQmqXWfg/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JdfTMXK9yi+LAQHuWjj8hbfxj36WujJp2QlENFaEItZxXgdU/9ji/PztEj99W2/12HPelfsdOaaUauuZFjPp0TX16kHBAnUBwdgHAyitqilLERXW/GOQ13IUkVWbWIRpYC7oGoPMTXVal97VsaEMNndf/FWCgf+KXj/ADkcnXiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fN35foU/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 466F3C4CEC4;
	Fri, 30 Aug 2024 07:24:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725002690;
	bh=T6yjIwLOMmggHigQLJYgxnquiNY/1xjA1gQmqXWfg/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fN35foU/9s7DcHhYroPEwcmqWkaLvfi7JVcNKXAv2KM0KUXMDWoKQRoytTPozntQH
	 q/e5uC7I0VlOJZA/7+2vFuVHdamNc1q8hyj1HhBhqQu/XmxatiezjqW+qTjHJ19D15
	 GbqolJFJK/CHH+UaCyGGuIA5I9hz/I/FP2mecrkJRn8MnLLdsHj9bgARnAGZWU9zm6
	 xuOKsarpHloc/Jyduz3vDMP96cUzAgZX99kSIQ4ZdfaKzgqYeRAgfSSxakD9QvHQEn
	 8N7xL2g5pabZFTUVARaa69zhAUCPNJAtczmD6/HonziZ1mwhz2IxBFALzPcX7k7WQO
	 gACNJU4woJQLw==
Date: Fri, 30 Aug 2024 12:54:47 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patches in the dmaengine tree
Message-ID: <ZtFzv7Nu2RfWAJhY@vaman>
References: <20240830144746.58b98a53@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830144746.58b98a53@canb.auug.org.au>

On 30-08-24, 14:47, Stephen Rothwell wrote:
> Hi all,
> 
> The following commits are also in the dmaengine-fixes tree as different
> commits (but the same patches):

Yeah I should have merged the fixes into next, let me fix that up,
thanks

-- 
~Vinod

