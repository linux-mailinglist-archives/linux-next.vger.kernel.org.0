Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BC0049EA48
	for <lists+linux-next@lfdr.de>; Thu, 27 Jan 2022 19:22:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244930AbiA0SW3 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 27 Jan 2022 13:22:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244883AbiA0SW2 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 27 Jan 2022 13:22:28 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E303C061714
        for <linux-next@vger.kernel.org>; Thu, 27 Jan 2022 10:22:28 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 5953E37C;
        Thu, 27 Jan 2022 18:22:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 5953E37C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1643307747; bh=XfL2rMwB81zqw0aoEZ5tU0tqjPVDfzEabS+h9K9qU/E=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=mIcmoZxWDfNULtRHqDbvsxc0oPqCU0Q737OqMOGlYsarY2WD5TfzUixpnRTC3GwGV
         tVCGrUdLbC1wiX2rvluCRr4kBSbS5Bo/bBe+q2BICQz6yT1efflCrVUiwnL/LMYZrn
         vGYL1QJurfB2Oe1MzsOAXmDKb4WQllG+XaePTg8yUuZrBZE+UeabHzJbXUZUcSPjjr
         XSXG3EabEdgSwZ4Q2hnKaG3pAEMWy7LF7EdVhvVRIlLYvINk7dUO4EuBCHoS7KNHCZ
         EWqfo7SK8DDn/+hbAlGyJ8vE4/1XS0p0vJxM9BegJp1HpVyGA80sMCDM9cb5RaczY9
         CDXZEzcCkCypw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the jc_docs tree
In-Reply-To: <20220127141518.54dbb9a8@canb.auug.org.au>
References: <20220127141518.54dbb9a8@canb.auug.org.au>
Date:   Thu, 27 Jan 2022 11:22:58 -0700
Message-ID: <87fsp9rqbh.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Stephen Rothwell <sfr@canb.auug.org.au> writes:

> Hi all,
>
> After merging the jc_docs tree, today's linux-next build (htmldocs)
> produced these warnings:
>
> Documentation/tools/index.rst:2: WARNING: Explicit markup ends without a blank line; unexpected unindent.
> Documentation/tools/index.rst: WARNING: document isn't included in any toctree

So this is bizarre...somehow the change to Documentation/index.rst that
brings all this stuff in didn't survive the cherry-pick that brought
that change into docs-next.  No idea how that came to be.

The other warning, instead, was just me being dumb about inserting the
SPDX lines and forgetting the necessary blank line.

Fixed (forcing a rebase of docs-next), apologies for the noise,

jon
