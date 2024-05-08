Return-Path: <linux-next+bounces-2224-lists+linux-next=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7FCC8BF6C4
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 09:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5786F1F21F7A
	for <lists+linux-next@lfdr.de>; Wed,  8 May 2024 07:10:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353C122338;
	Wed,  8 May 2024 07:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b="ERhsHfJJ"
X-Original-To: linux-next@vger.kernel.org
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [91.218.175.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E7C168DC
	for <linux-next@vger.kernel.org>; Wed,  8 May 2024 07:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715152249; cv=none; b=jGFQY6fODtV6oBSPloAq5IwsDfMCIK/sVVxWObvwaVpH7OWN5BQPZuEvuQyM6COtnc4GIlijpsWG9Mparple0l7+e5IurshxEFv2TGKwPofHR1XQjfH6PV9UV20QcU395/+Pp/b/jLsEZY3BWPpBF3665PI8v6lDlZEi85oIpKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715152249; c=relaxed/simple;
	bh=Em/KLUSevtkK4OAZHe8Vyh97ACKtMm9T638AHURgh4I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dHehY17Jiz0PbgUj4nbK2pnjdAFsb3rn22c5EUUaZ0DBaVg1EUnS9I2dp6q7pwjPgjuq40zKSNibJsdg0/AfuvUGxcYuD3eHxkdchOGD61TY9lS78yOi4aNfkHS+Dv/SwyieNA28rdgnuBqv1u+1N2ZIV/+o8AJfuhmKxuuGLV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf; spf=pass smtp.mailfrom=kl.wtf; dkim=pass (2048-bit key) header.d=kl.wtf header.i=@kl.wtf header.b=ERhsHfJJ; arc=none smtp.client-ip=91.218.175.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kl.wtf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kl.wtf
Message-ID: <57475c76-4ceb-4884-ad77-ec0553306f88@kl.wtf>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kl.wtf; s=key1;
	t=1715152245;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EmKc8PNN68B9E8x76xQ3+Dr0o+X8Rs+4fcLRuJ9I8Ns=;
	b=ERhsHfJJ//b+PjmztuVfnaahKTbX8mURjI5suCik1lDI1eGtxKwmRCYTzD1il11uresjNS
	O/uU9Xpw4pWcNEzdPwlai8815n8NxPlNrK5S8LpPvKqKMo3QVWlG9nNYfW3H18Zii8h+Zd
	73N0WYUatcON8nyOWS7vJAra1RY9eLYe5sY1eZgoQhQ72H4t6RIVpprTqluB/W7BdIXZJ4
	8seC4u0mZukhK4XJRjJs9ndHWpFzwHrye56IirxvhMnHmfTWAGoOFlPv4GuTS03XfO5+J5
	rY4uHCy4+fU02buO7W942JnefnqDNWXl2G1lFKQWwo1q7pDpgVtlexW82Wwf6A==
Date: Wed, 8 May 2024 09:10:20 +0200
Precedence: bulk
X-Mailing-List: linux-next@vger.kernel.org
List-Id: <linux-next.vger.kernel.org>
List-Subscribe: <mailto:linux-next+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-next+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: linux-next: Fixes tag needs some work in the hid tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20240508073528.402fd13f@canb.auug.org.au>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kenny Levinsen <kl@kl.wtf>
In-Reply-To: <20240508073528.402fd13f@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 5/7/24 11:35 PM, Stephen Rothwell wrote:
> Maybe you meant
>
> Fixes: 7d6f065de37c ("HID: i2c-hid: Use address probe to wake on resume")

... Yeah, seems like I picked the SHA off the wrong tree in my rush to 
fix my previous mistake. Sorry about that.

I need a vacation.

