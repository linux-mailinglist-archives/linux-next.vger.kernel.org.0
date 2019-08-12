Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C421C89F6A
	for <lists+linux-next@lfdr.de>; Mon, 12 Aug 2019 15:16:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728117AbfHLNQK (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 12 Aug 2019 09:16:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:13804 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726219AbfHLNQK (ORCPT <rfc822;linux-next@vger.kernel.org>);
        Mon, 12 Aug 2019 09:16:10 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D0620306028B;
        Mon, 12 Aug 2019 13:16:09 +0000 (UTC)
Received: from pauld.bos.csb (dhcp-17-51.bos.redhat.com [10.18.17.51])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 6912F1000321;
        Mon, 12 Aug 2019 13:16:08 +0000 (UTC)
Date:   Mon, 12 Aug 2019 09:16:06 -0400
From:   Phil Auld <pauld@redhat.com>
To:     Will Deacon <will@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        linux-next@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Will Deacon <will.deacon@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Mark Brown <mark.brown@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Peter Zijlstra <peterz@infradead.org>, tglx@linutronix.de,
        dietmar.eggemann@arm.com
Subject: Re: Fwd: [CRON] Broken: ClangBuiltLinux/continuous-integration#895
 (master - 2a3984b)
Message-ID: <20190812131606.GB11058@pauld.bos.csb>
References: <ClangBuiltLinux/continuous-integration+122566420+broken@travis-ci.com>
 <5d4d7164795c7_43f9afa8b58b0242711@29afa0b1-fa00-407e-a40e-a8edb471126a.mail>
 <CAKwvOd=2v0j5=-q9662xiv9ofrKfQm+04KUQAo1pEz+6MZXYMg@mail.gmail.com>
 <20190812125414.3zeysojdycfuowyy@willie-the-truck>
 <20190812125542.eiv5cfjpfj3oke2p@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812125542.eiv5cfjpfj3oke2p@willie-the-truck>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.47]); Mon, 12 Aug 2019 13:16:10 +0000 (UTC)
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Aug 12, 2019 at 01:55:43PM +0100 Will Deacon wrote:
> On Mon, Aug 12, 2019 at 01:54:14PM +0100, Will Deacon wrote:
> > Phil -- is there a fix queued for this somewhere?
> 
> Ha, tglx beat me by two minutes. This is now fixed in -tip.
> 
> Will

Yeah, it's now fixed. Sorry about that...


Cheers,
Phil
-- 
