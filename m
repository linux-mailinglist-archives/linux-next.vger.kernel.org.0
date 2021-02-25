Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A2763258D8
	for <lists+linux-next@lfdr.de>; Thu, 25 Feb 2021 22:41:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233242AbhBYVk4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 25 Feb 2021 16:40:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234586AbhBYVkz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 25 Feb 2021 16:40:55 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFD28C061574
        for <linux-next@vger.kernel.org>; Thu, 25 Feb 2021 13:40:14 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id BAE668B2;
        Thu, 25 Feb 2021 21:39:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net BAE668B2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1614289173; bh=1Un8cfaLsFI+U4Z+qytxlqyMLxZAbAbbKGb98C1S2og=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=h9tpOTXRo0ZJRt6qrmzmGXpkzpwjTcZIJAmIsn1AwQI+7w0x+yiaQuiv9BFRP9rOU
         svMrRMCijUs9C8oZdClPGHbaMYIhYyGZF00bZpkdiomHfMlgeHSQ0cLKtn1LB+o6is
         6KPtoCy8RR+YWYylPvw1/rBV2hCW60Kckgehk69y2aHhpOy6isGFA5FoEhRbnLmHaP
         yX5tuokTLmA5OHM3VCqRL6KLHC+8woLd83A8A8r89HGx3yK8/lpoBKat9mma6CtAlh
         gjp+7TOl36FKxnt4pGFBC0b8VNxzztpfHTfHFc3/Uu/Eig5A62/ehWTD5/wEOdbg4K
         eaffhZSXRWoXw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Andrew Donnellan <ajd@linux.ibm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: Fixes tag needs some work in the jc_docs tree
In-Reply-To: <20210226083433.1419e9c9@canb.auug.org.au>
References: <20210226083433.1419e9c9@canb.auug.org.au>
Date:   Thu, 25 Feb 2021 14:39:33 -0700
Message-ID: <87a6rrbze2.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> In commit
>
>   36eaf08fc283 ("docs: powerpc: Fix tables in syscall64-abi.rst")
>
> Fixes tag
>
>   Fixes: 209b44c804c ("docs: powerpc: syscall64-abi.rst: fix a malformed table")
>
> has these problem(s):
>
>   - SHA1 should be at least 12 digits long
>
> I don't think this is worth rebasing for, but in the future it can be
> fixed by setting core.abbrev to 12 (or more) or (for git v2.11 or later)
> just making sure it is not set (or set to "auto").

I made that tag by hand while "fixing" the changlog on that commit,
which included the full ID.  Obviously, counting to 12 is a challenging
task for a slow guy like me...:)

Thanks,

jon
