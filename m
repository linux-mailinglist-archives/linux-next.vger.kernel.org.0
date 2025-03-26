Return-Path: <linux-next+bounces-6024-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 910A0A71BFE
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 17:38:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7F2A5189AC53
	for <lists+linux-next@lfdr.de>; Wed, 26 Mar 2025 16:38:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D57DE1B3950;
	Wed, 26 Mar 2025 16:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T1BYtlvZ"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D8515CD55;
	Wed, 26 Mar 2025 16:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743007101; cv=none; b=eUqcjyi1RWv0sHvzCFRsMJjBbPNGVSkVO4F6O28SGm+zuYk7w4oND8J7YmLpT8/EtvtVb6uEbXyfFYErgZGGF6fZnxsSTM0kpr6lguO8WJsEP35vvh9PQniZy3n1C9nMv8z9r4tVQbyZi77BlXqvRGvz236cCb4DW1DvR7FwubM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743007101; c=relaxed/simple;
	bh=qBVY4F3QduFjz8Jz2FokZhmoQXYIaWFtIeHUflAHdz0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=j5oAl8L4LzW/GNeY7T1L8tkmaa5HlEoL6fI3r2c3ZYhb6qbseBoshCabklhX2q+un8U0olWbfMEZhQEzjzKiL0PObZmLmpsW5OS8iU2iqvDdvK9ZTJ0wAZwvE8nBlydnW92H4OSQoHJpESVNSrEsgUK22Bmk8jP2VdMgTBAivTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T1BYtlvZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF1DC4CEE2;
	Wed, 26 Mar 2025 16:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743007101;
	bh=qBVY4F3QduFjz8Jz2FokZhmoQXYIaWFtIeHUflAHdz0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=T1BYtlvZSFyu7yuaxPq72wctXqQ+dEvomGXNaHasgRBIiBG2sCc723GIQ0GEm5tWT
	 4vaLyF01Rau02HdB+LMxTrf1DuxXiJdoBHI+vKCcmMov1MetJjKb9XfG4Vuxlogq85
	 ShunbfPq1uwDDj/BliciUEQV35XkHo0sQRxd385WqXNTti6rl4J7TiswWXNbrkAn8x
	 CXP4ZooFH1ICLbNr8F/mRWDBHxn6rRN1kfcnhtNZEcz0of79+y2cHnDLre2MdO+hqX
	 l4H3D4h4bEJis+NitwmxXLhkY3bhoVVVbw3q0vlilpLHTMQqjLcmumY/2SwrOMnIsJ
	 5mxpFJYb0aFiA==
Date: Wed, 26 Mar 2025 09:38:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: John Johansen <john.johansen@canonical.com>, David Miller
 <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, Kuniyuki Iwashima
 <kuniyu@amazon.com>, Networking <netdev@vger.kernel.org>, Linux Kernel
 Mailing List <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build failure after merge of the apparmor tree
Message-ID: <20250326093819.7bd9bc86@kernel.org>
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
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 26 Mar 2025 14:31:44 +1100
> Subject: [PATCH] fix up for "apparmor: add fine grained af_unix mediation"
> 
> interacting with "af_unix: Move internal definitions to net/unix/."
> 
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Applied to net-next, and included in our 6.15 PR. Thanks!

