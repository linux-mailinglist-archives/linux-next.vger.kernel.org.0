Return-Path: <linux-next+bounces-7639-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 883BBB0B3A9
	for <lists+linux-next@lfdr.de>; Sun, 20 Jul 2025 08:04:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0B79E3B21C3
	for <lists+linux-next@lfdr.de>; Sun, 20 Jul 2025 06:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B041B18BC3B;
	Sun, 20 Jul 2025 06:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEzqdiX6"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D19876034;
	Sun, 20 Jul 2025 06:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752991475; cv=none; b=rE+Wu+U4dqffL3VqW1j7QA8+Egtu36WQmebNPlBv8dcl+AfwaaAq3WziqhWIx/8v42PQMQNauRcDZt/YrDupmC+NgvkPMUZMvrn5qxay3xPzE9O3frlvMLgcNA6y8jL+Kx5gsX9EPZ9+iDZWETGahaaIGfVXcJ0ZWtlOYeyTIgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752991475; c=relaxed/simple;
	bh=An5k17U29r42lEnUbQ1RUElgiWJiY418MpStyGNPHHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZWM9vtpkxb6SncuVZfboucHheEBjh97ldVEQiA4bxfjTqfhc1W4ntCCWICYkNYx/njX0QQD+ddJ6EiYg411b8Hq9xBxI3u7z/8WPrsooKjLMrUePAMmDes8105wace1QdtBh83v6C3LHYSziztfqjzL5QIQ3AdV8fvM/F1x+hjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEzqdiX6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F10BBC4CEE7;
	Sun, 20 Jul 2025 06:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752991475;
	bh=An5k17U29r42lEnUbQ1RUElgiWJiY418MpStyGNPHHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AEzqdiX6gdkruyVUJVxRX3yMN9q8VsmeQ4dhsFv2814b5GsxZNIZ/AJ9wgDhJ1x6Z
	 Ag6s5Q2Hk1ldVgDTYWSICQiisgjYulKcjG6lMSxJkKxdYinCyQ/NygGMuGLkqXibZm
	 /n8BGdzOPFLZKizfJD2Ln2TbblcfYrxi9ugf0GTdACYWxbutDcOd+JntJWo0/2Wgiy
	 H/9JhooRySRyid1k2L4pI5DidOIYXdVOHGkt6q8rlaQmcy4lk+2dCvOFRBazFwiSIy
	 p/aOkngwVNrXakLUDw3xlyNSYLRqIVZx10RzA3wsTZEf05iT8k3A5MQX9dpC241/ZJ
	 GY/2Ct0dqWGzA==
Date: Sat, 19 Jul 2025 23:04:34 -0700
From: Kees Cook <kees@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the kspp tree
Message-ID: <202507192304.01CC58A0F@keescook>
References: <20250718204039.5a3c3bfa@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718204039.5a3c3bfa@canb.auug.org.au>

On Fri, Jul 18, 2025 at 08:40:39PM +1000, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the kspp tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:
> 
> ERROR: modpost: missing MODULE_LICENSE() in lib/tests/seq_buf_kunit.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in lib/tests/seq_buf_kunit.o

Thanks for noticing this! I'm not sure why my local builds missed it.
Now fixed.

-Kees

-- 
Kees Cook

