Return-Path: <linux-next+bounces-42-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C088D7F573A
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 05:04:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 511C5B210CC
	for <lists+linux-next@lfdr.de>; Thu, 23 Nov 2023 04:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AFE2B64A;
	Thu, 23 Nov 2023 04:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWK1r8kh"
X-Original-To: linux-next@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086218C16;
	Thu, 23 Nov 2023 04:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 282DAC433CB;
	Thu, 23 Nov 2023 04:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700712268;
	bh=KmxTa8bVp0SFdeKiJ3bvpxAg995JDczqNvga4SYbSWo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CWK1r8kh8zewWnlPSjyTYqxCXOjrG492jjJasW8HH+LiH2BwuJ3cKJuOnFmfORvdb
	 Bk+rD1TfYwoZDtM76N0tdNhceFfAnA4guuvM+NakVWb1OQ3wXcctHJnmyj5VZDDfC3
	 vCC1CNM4LZvTKpgxnAKrMw1UVieLbxe6OoWsQwzjxwDEHvd2Z96AvJdQY0TlO/bnT/
	 EoGk6Yingh+qkilpGD5eaUQXP1qK7qPx2NegTe2t6D+X/0x6rXK/3OR45fIJp3p/l3
	 9Mm8rcZFKmoxYhBkRsFEvNSYsU3c9Pxn/uffceJLfG+hkIbia1p1h+UrnfMQb1gw30
	 zU37POF3C+gvA==
Date: Wed, 22 Nov 2023 20:04:26 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Networking <netdev@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the net-next tree
Message-ID: <20231122200426.390e0068@kernel.org>
In-Reply-To: <20231123134545.3ce67bd4@canb.auug.org.au>
References: <20231123134545.3ce67bd4@canb.auug.org.au>
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 23 Nov 2023 13:45:45 +1100 Stephen Rothwell wrote:
> include/net/page_pool/types.h:73: warning: Function parameter or member 'STRUCT_GROUP(' not described in 'page_pool_params'

Yes, sorry, the script is confused when group contains only private
fields. I'll add a public field there any day now (tm) so the warning
will go away.

