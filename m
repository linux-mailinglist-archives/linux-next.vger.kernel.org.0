Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 451A92B39D7
	for <lists+linux-next@lfdr.de>; Sun, 15 Nov 2020 23:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727866AbgKOWXw (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Sun, 15 Nov 2020 17:23:52 -0500
Received: from smtp-fw-33001.amazon.com ([207.171.190.10]:20058 "EHLO
        smtp-fw-33001.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727857AbgKOWXv (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Sun, 15 Nov 2020 17:23:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1605479031; x=1637015031;
  h=to:cc:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding:subject;
  bh=EaRQldfO8KFr7HM4nW+vTgWxrXidbLUDsR2OGeWwHzQ=;
  b=bnYufpnEFI+1v7EvoVbzGSOan08Z5XrFWb/4Jy4wJSA2oPLVBlb4rYoa
   9rKILC3ygBgDcSzendhiH4NifdT+pcmYE80rYwr/Ssbmp4sO05ja4agYv
   xnLZR6JvjBmlRhbfWAX6k0OL2OP8FHjh4Px36GHntiJ7eNnIuw6u4CJv9
   Y=;
X-IronPort-AV: E=Sophos;i="5.77,481,1596499200"; 
   d="scan'208";a="94208672"
Subject: Re: linux-next: build warning after merge of the tip tree
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-33001.sea14.amazon.com with ESMTP; 15 Nov 2020 22:23:40 +0000
Received: from EX13MTAUWB001.ant.amazon.com (pdx1-ws-svc-p6-lb9-vlan2.pdx.amazon.com [10.236.137.194])
        by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS id D2B3A1A0408;
        Sun, 15 Nov 2020 22:23:39 +0000 (UTC)
Received: from EX13D01UWB002.ant.amazon.com (10.43.161.136) by
 EX13MTAUWB001.ant.amazon.com (10.43.161.207) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Sun, 15 Nov 2020 22:23:39 +0000
Received: from uc18d6cc16d755e.ant.amazon.com (10.43.161.55) by
 EX13d01UWB002.ant.amazon.com (10.43.161.136) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Sun, 15 Nov 2020 22:23:37 +0000
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@elte.hu>, "H. Peter Anvin" <hpa@zytor.com>,
        Peter Zijlstra <peterz@infradead.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
References: <20201028142300.34ed89b1@canb.auug.org.au>
From:   Balbir Singh <sblbir@amazon.com>
Message-ID: <4614a858-3719-f8c0-3543-faab3524b8b8@amazon.com>
Date:   Mon, 16 Nov 2020 09:23:34 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201028142300.34ed89b1@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.43.161.55]
X-ClientProxiedBy: EX13D41UWB001.ant.amazon.com (10.43.161.189) To
 EX13d01UWB002.ant.amazon.com (10.43.161.136)
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 10/28/20 2:23 PM, Stephen Rothwell wrote:
> Hi all,
> 
> After merging the tip tree, today's linux-next build (htmldocs) produced
> this warning:
> 
> Documentation/admin-guide/hw-vuln/l1d_flush.rst:25: WARNING: undefined label: documentation/userspace-api/spec_ctrl.rst (if the link has no caption the label must precede a section header)
> 
> Introduced by commit
> 
>   767d46ab566d ("Documentation: Add L1D flushing Documentation")
> 

Looking at it thanks, I am no expert with sphinx, but it seems like I need angular braces around the link

Balbir Singh.
