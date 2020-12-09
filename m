Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15BD02D4475
	for <lists+linux-next@lfdr.de>; Wed,  9 Dec 2020 15:35:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730595AbgLIOel (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Dec 2020 09:34:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727466AbgLIOeg (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Dec 2020 09:34:36 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EA9AC0613D6;
        Wed,  9 Dec 2020 06:33:56 -0800 (PST)
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0E4F430D;
        Wed,  9 Dec 2020 14:33:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0E4F430D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1607524433; bh=swow8pl7OffrYs3ANyg+2rzRyArT6YA9zzSfHY5IRfY=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=sWx75+7GF6iAIvlzxtHNYTqarDuOFBzRSb87M+OMXwoC7CPwx1pgQx8f7Q7p2Hap8
         mZa/y2+lEYXDkldgsIS0dW/+XxLYrAeRPS0YiY5XQJAE5r3n4rgxRC9AGSY9Rzl0GW
         fI2HMGjM5PSlzvPBqeQY6EKtcF8TCX/IRe7kD7IPjsqrs9Z/6TQXuFsz8h/tqJ4njY
         1bSM6f15Ma3BFdQeY5lJ/8glg+Jh5XmeEcBxdd236UM4A1UqyH+buxYZnP/+N21fsz
         uSgN1Ze7UGMcjtrVCVbGFTpQ0DWtgBCTCK/1D0PVAIMt2LOIUUthilb4j9CWRunSxn
         OzoihNGocskCw==
Date:   Wed, 9 Dec 2020 07:33:52 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: [External] linux-next: build failure after merge of the pm tree
Message-ID: <20201209073352.178d5027@lwn.net>
In-Reply-To: <203934b6-dd68-b02d-757f-c0336352d397@lenovo.com>
References: <20201209205754.41ac2424@canb.auug.org.au>
        <203934b6-dd68-b02d-757f-c0336352d397@lenovo.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Wed, 9 Dec 2020 08:56:31 -0500
Mark Pearson <markpearson@lenovo.com> wrote:

> I do see:
>    WARNING: document isn't included in any toctree
> but I think this is benign - I believe I'm getting it just because I
> converted the file to .rst (as requested by Andy Shevchenko). If this is
> important and needs to be addressed urgently as well let me know.

Normally this is solved by adding the newly created document to the
index.rst file in the same directory.

There isn't one in Documentation/ABI/testing, though; in fact, there are
no RST files there.  Files in Documentation/ABI are in a special format
that is processed into RST during the docs build.  If we want to add
information outside of any specific ABI entry there, we're going to have
to decide how we want to do that.  It may well be, though, that the
introductory information just belongs in the admin guide instead.

Thanks,

jon
