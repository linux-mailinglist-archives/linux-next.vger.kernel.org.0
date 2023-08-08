Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0954774380
	for <lists+linux-next@lfdr.de>; Tue,  8 Aug 2023 20:06:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235247AbjHHSGo (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 8 Aug 2023 14:06:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235251AbjHHSGW (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Tue, 8 Aug 2023 14:06:22 -0400
X-Greylist: delayed 3603 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 08 Aug 2023 10:05:28 PDT
Received: from h1.cmg2.smtp.forpsi.com (h1.cmg2.smtp.forpsi.com [81.2.195.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BF45A17E
        for <linux-next@vger.kernel.org>; Tue,  8 Aug 2023 10:05:27 -0700 (PDT)
Received: from lenoch ([91.218.190.200])
        by cmgsmtp with ESMTPSA
        id TK6xqN1CNv5uITK6yqWFVz; Tue, 08 Aug 2023 12:38:49 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691491129; bh=99a8sbPMFP6BIytgJuHTfTeDV1YHpAKlfAo4I1ukHl8=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=2FDU8Vy979bUmdApcVHkL00l92KeU9sbWPCHnj74QyRRQrbUXzTW/OHW2SCO6/lkx
         51sF9E6z6w4AY1nEMuAtZcW3wbwiFdwASOhNPgxdNG/xy8HFJViH31hcmpZKkgjr1t
         2fERVOMdYsWlAByG0m5PO3MR0ezdhGEch2nJn2y9aMYGRi9Hj3iCOw9Gfilk01dYVo
         5VVyiwR77KWKyj9rOiw7m9HcOxsjVDrsUGtsY61GBSV1Xjwy/uBzsw7LZt+gfo+Kj6
         /4Co0PW0wRARoJKOrK/bviaS2f+qTzcBnlkS7b0iX88IKFQ3B1I0j14taAgbyA3Ed2
         9dBdtkYIFmvbQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triops.cz; s=f2019;
        t=1691491129; bh=99a8sbPMFP6BIytgJuHTfTeDV1YHpAKlfAo4I1ukHl8=;
        h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
        b=2FDU8Vy979bUmdApcVHkL00l92KeU9sbWPCHnj74QyRRQrbUXzTW/OHW2SCO6/lkx
         51sF9E6z6w4AY1nEMuAtZcW3wbwiFdwASOhNPgxdNG/xy8HFJViH31hcmpZKkgjr1t
         2fERVOMdYsWlAByG0m5PO3MR0ezdhGEch2nJn2y9aMYGRi9Hj3iCOw9Gfilk01dYVo
         5VVyiwR77KWKyj9rOiw7m9HcOxsjVDrsUGtsY61GBSV1Xjwy/uBzsw7LZt+gfo+Kj6
         /4Co0PW0wRARoJKOrK/bviaS2f+qTzcBnlkS7b0iX88IKFQ3B1I0j14taAgbyA3Ed2
         9dBdtkYIFmvbQ==
Date:   Tue, 8 Aug 2023 12:38:46 +0200
From:   Ladislav Michl <oss-lists@triops.cz>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Linux-Next Mailing List <linux-next@vger.kernel.org>,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        lkft-triage@lists.linaro.org, Thinh.Nguyen@synopsys.com,
        Arnd Bergmann <arnd@arndb.de>,
        Anders Roxell <anders.roxell@linaro.org>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [PATCH] usb: dwc3: dwc3-octeon: Verify clock divider
Message-ID: <ZNIbNj4Orr7PEqY9@lenoch>
References: <ZNIM7tlBNdHFzXZG@lenoch>
 <2023080830-wincing-goldmine-def9@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023080830-wincing-goldmine-def9@gregkh>
X-CMAE-Envelope: MS4wfO980XvXG+2EkWJZqrMEX/eYOZqR+vRYsxAipUQDIJ1MryLpKUMcBJOCUzM4Kt3JE4EKHdy5HH9CP7SZhDJHA+GNzaU2hzQuIrZwvVmrASUkIqvec1c0
 z3Ko5Mt2Uji4SVSVq7HlL7aCYmJ8zZsjKKQOksbSIiidehvjFHg4HIKt7KuvD3XkCQa1YDz7wSQdprMlZRDapKo1QHASzF+wTVqGdJXxR1C1Q9zG9lZK+dNb
 2UVa2gQcxDR0RD6qfUSu2PImD6ybEC17M3vf0XiwuCTUmjkW98C8mXGtVMeI/GMTy7PXf1fy4PDBKbQmQMGQthY3tmGbdhMvl5UTgWp+t2At6j9q8X5oCVxJ
 g00EgEJ1Bp72E0OovaYUIMrQ7q9J5OmG4QYQNgQik1imkcRWxq7kbPKCv9Cg64JI+SIIDeq/vgYLgq/DVp8E8OutoIcy9SNEieYTkbl9RixjpLBkd+OMSnCG
 RMp2iocNfRdib4x4XUK852jLd52Dx1uaJRpqrQ==
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 08, 2023 at 12:00:42PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Aug 08, 2023 at 11:37:50AM +0200, Ladislav Michl wrote:
> > From: Ladislav Michl <ladis@linux-mips.org>
> > 
> > Although valid USB clock divider will be calculated for all valid
> > Octeon core frequencies, make code formally correct limiting
> > divider not to be greater that 7 so it fits into H_CLKDIV_SEL
> > field.
> > 
> > Signed-off-by: Ladislav Michl <ladis@linux-mips.org>
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> > Closes: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20230808/testrun/18882876/suite/build/test/gcc-8-cavium_octeon_defconfig/log
> > ---
> >  Greg, if you want to resent whole serie, just drop me a note.
> >  Otherwise, this patch is meant to be applied on to of it.
> 
> On top of what series?

I'm sorry, "[PATCH v5 0/7] Cleanup Octeon DWC3 glue code".
In your usb-next, last patch of serie is:
d9216d3ef538 ("usb: dwc3: dwc3-octeon: Add SPDX header and copyright")

Thanks,
	l.
