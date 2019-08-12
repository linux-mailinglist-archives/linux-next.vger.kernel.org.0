Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEFBB89EEE
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 14:55:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfHLMzs (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 08:55:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:46714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726481AbfHLMzs (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Aug 2019 08:55:48 -0400
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C940520679;
        Mon, 12 Aug 2019 12:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565614547;
        bh=hQaWEjTLnv8YJvKfaSDYDahsRXbzkZ2zeOxhzlPCDIs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=iDDjjG+FuM/x5SMUceO/NUKGLEswSkBLWeKXh12kzilSn3xprRTIt22vdHGVOhN9A
         MglaQ0XaxhQBwTTgn66hg4NHTXlR9BVbHnkppsrOWE61btTdu9fLYLCpkTsGge7KDy
         gxPXi8V+8/YOI5AGQA9hUtxb6naZULsAFdolNXi4=
Date:   Mon, 12 Aug 2019 13:55:43 +0100
From:   Will Deacon <will@kernel.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     linux-next@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>, pauld@redhat.com,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Brown <mark.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Peter Zijlstra <peterz@infradead.org>, tglx@linutronix.de,
        dietmar.eggemann@arm.com
Subject: Re: Fwd: [CRON] Broken: ClangBuiltLinux/continuous-integration#895
 (master - 2a3984b)
Message-ID: <20190812125542.eiv5cfjpfj3oke2p@willie-the-truck>
References: <ClangBuiltLinux/continuous-integration+122566420+broken@travis-ci.com>
 <5d4d7164795c7_43f9afa8b58b0242711@29afa0b1-fa00-407e-a40e-a8edb471126a.mail>
 <CAKwvOd=2v0j5=-q9662xiv9ofrKfQm+04KUQAo1pEz+6MZXYMg@mail.gmail.com>
 <20190812125414.3zeysojdycfuowyy@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812125414.3zeysojdycfuowyy@willie-the-truck>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 12, 2019 at 01:54:14PM +0100, Will Deacon wrote:
> Phil -- is there a fix queued for this somewhere?

Ha, tglx beat me by two minutes. This is now fixed in -tip.

Will
