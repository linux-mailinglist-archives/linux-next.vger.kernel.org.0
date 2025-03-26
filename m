Return-Path: <linux-next+bounces-6021-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B56E6A715B3
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 12:27:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87AD9188A4E7
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 11:27:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C42F1D5CC4;
	Wed, 26 Mar 2025 11:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bSUE6sXC"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27F21DB933;
	Wed, 26 Mar 2025 11:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742988417; cv=none; b=r/H+Ee2Hk0ZOqSO2P66CFlExy5yd/mTlQ3sw7eRawEAcZNqIfe0srdssVR7BpiLxhuhqaNXqqMsuKwGSQer7+39YT/fTJsWE+w6z5M6sPGpGngg0gEURFRc/vQMOEekbx5y1Xp8Dx30HY4O4xhou4fFgbp5HSUZE8xQxFDViof4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742988417; c=relaxed/simple;
	bh=B0tO8CnDZPZrFA4sBgQRkOGBZgqifgPJ7rFS0OAnDy0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LhV7FvwDP04Ig5lxBn1lfacRP4LcknSnyPrzuIyOp4DegIaIPA5wgFRtg9O5JFDIBiMaWQv/gESb3m9ZVLQbVpq5Wpbz+nhZOEVfHvq9x3QOjzu2KFz+rb6CIZFIhti0TB0XEi/PUC6XiaAx8SAodK4brHCyOtWQnR6MO9FqFa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bSUE6sXC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2987DC4CEEA;
	Wed, 26 Mar 2025 11:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742988416;
	bh=B0tO8CnDZPZrFA4sBgQRkOGBZgqifgPJ7rFS0OAnDy0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bSUE6sXC1KNdeZDssxyZ0t01qYtSaEslX1Mn8TG3KqHZLdWAGdjEPK1Nfcez4ITWc
	 ofIAWnnGAUyIaXvM+swSexz4rHgqnafGiZ0SW6Si7D0DFAcBoq0G7JQtddekBM1lzr
	 gbknQZU61VE2IOIhiHswZVHkr7NtKQBtfBOb8QPIn5MyW4IqERQ3YKZwaettUoXQi8
	 icHOdzRnQ/un2M5YERUL9Alot8fCgMUBzNm+tmbyGfamvZgbdTXYcp0ySNksEsyMSb
	 xwMAao8OSGOohZxVBu3PrZTwLddi0cds2uX03Ek6lHw76H9q/1FpwGGz3D/tKf/cfX
	 pWI5ws7LRuVug==
Date: Wed, 26 Mar 2025 04:26:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Kuniyuki Iwashima
 <kuniyu@amazon.com>
Cc: John Johansen <john.johansen@canonical.com>, David Miller
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Networking
 <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the apparmor tree
Message-ID: <20250326042655.4e160022@kernel.org>
In-Reply-To: <20250326150148.72d9138d@canb.auug.org.au>
References: <20250326150148.72d9138d@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 26 Mar 2025 15:01:48 +1100 Stephen Rothwell wrote:
> After merging the apparmor tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
> 
> security/apparmor/af_unix.c: In function 'unix_state_double_lock':
> security/apparmor/af_unix.c:627:17: error: implicit declaration of function 'unix_state_lock'; did you mean 'unix_state_double_lock'? [-Wimplicit-function-declaration]
>   627 |                 unix_state_lock(sk1);
>       |                 ^~~~~~~~~~~~~~~
>       |                 unix_state_double_lock
> security/apparmor/af_unix.c: In function 'unix_state_double_unlock':
> security/apparmor/af_unix.c:642:17: error: implicit declaration of function 'unix_state_unlock'; did you mean 'unix_state_double_lock'? [-Wimplicit-function-declaration]
>   642 |                 unix_state_unlock(sk1);
>       |                 ^~~~~~~~~~~~~~~~~
>       |                 unix_state_double_lock

Thanks Stephen! I'll pop this into the tree in a few hours,
just giving Kuniyuki a bit more time to ack.

