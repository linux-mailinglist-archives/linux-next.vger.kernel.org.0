Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 99B9A15AAE3
	for <lists+linux-next@lfdr.de>; Wed, 12 Feb 2020 15:23:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgBLOXd (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 12 Feb 2020 09:23:33 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:40689 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727781AbgBLOXd (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 12 Feb 2020 09:23:33 -0500
Received: by mail-pf1-f193.google.com with SMTP id q8so1320608pfh.7;
        Wed, 12 Feb 2020 06:23:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2CG8ksxxPOqr0AnERJ/PdtG9O/daCfWo5DfUdNbgZas=;
        b=JllzjkrRB5hg0Jei6ang1AiW8KaPckknGXzSJuwpvLzqlt3vERdsiwP74Qo3BXwspr
         hR87nSv3mDIl1cgRTrISAy0eQNeyrwQf0JIAggE6iXYzQO/Ce3tBoRWiEZWhLMFwTE6Z
         tHRD1JoUhop4fVlY8UMyW0HeLIhfoAVHQgG3mdIHDmYb2h21XnwLjBSkLhmrl7DvuLEt
         GugQr+KTRou6MiXtV6soXwBZfW3H+R2sTIldasINr+OzHTKx+yAaUh93myPq3WY2uOpN
         XuwRJ4Sc75dPv008QC9S7r5jVkTwGdI09GCvUtWUNbsM6zSuD9eeuzm290qcpIP1ESZ/
         f/5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2CG8ksxxPOqr0AnERJ/PdtG9O/daCfWo5DfUdNbgZas=;
        b=Ytp8WQSjFYsAc2jT7u7W0J0Vloyj8vdBG7dCbp1NylEWv1i7tvINgTPs9mnYcvDfT9
         raizbKcup/33TMgfIWtqyllVk6aFEQzJcXLeyO8Ky5lVp7kuHXl4hvkjpPlHyvz8ScPa
         +goVOfjuhhXRD0phz4k9CoXpAhASS8DCdmNJGxWVUh73YcLZDOH8KMT5cs3flPLINU0g
         Ol43vKwVwyCWGSTP/bJ7l01ExmMwLGT+zZrIoh5JHrq0mhcfPixizpD+vbuCMH1XNNNG
         cJW4YIP4aUtyuRmYxrB3KI5wZuyqMnKV5vvFEuc6SkLyx6NkfYiL5i/Wx5WnJ78wGy/s
         q1gg==
X-Gm-Message-State: APjAAAXd7F9bUzkEpk6LWOBwyaOR8qmZOnq/7Z7QfLg4PQ5EQ3NrZWCJ
        q0N8xmmVuEVWaiCICdLgEcuqN+g0ysWuxael57I=
X-Google-Smtp-Source: APXvYqwwT802Htg8/QLgGZfEl3X3B9sS1Nqnk9ag0wVeXU9UXD0zSNNN+/vGOTk50zGCdWCOveiGwSni6DcNPzpy4uU=
X-Received: by 2002:a65:5242:: with SMTP id q2mr12353141pgp.74.1581517412831;
 Wed, 12 Feb 2020 06:23:32 -0800 (PST)
MIME-Version: 1.0
References: <20200211130054.001bfce9@canb.auug.org.au> <f0d576b6-7204-0caf-1ca8-aae6c82d3b8d@infradead.org>
In-Reply-To: <f0d576b6-7204-0caf-1ca8-aae6c82d3b8d@infradead.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 12 Feb 2020 16:23:25 +0200
Message-ID: <CAHp75Ve3oenxkSCr9FC14MErQeN6pwrafemgKUNMwxUDr+aYKA@mail.gmail.com>
Subject: Re: linux-next: Tree for Feb 11 (drivers/platform/x86/intel_pmc_core.c)
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>,
        Vishwanath Somayaji <vishwanath.somayaji@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Feb 11, 2020 at 9:32 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 2/10/20 6:00 PM, Stephen Rothwell wrote:
> > Hi all,
> >
> > Changes since 20200210:
> >
>
> on i386:
>
> Function args are reversed (offset and status);
>
> ../drivers/platform/x86/intel_pmc_core.c: In function 'pmc_core_resume':
> ../drivers/platform/x86/intel_pmc_core.c:1329:43: warning: passing argument 4 of 'pmc_core_lpm_display' makes integer from pointer without a cast [-Wint-conversion]
>    pmc_core_lpm_display(pmcdev, dev, NULL, "STATUS", offset, maps);
>                                            ^~~~~~~~
> ../drivers/platform/x86/intel_pmc_core.c:977:13: note: expected 'u32 {aka unsigned int}' but argument is of type 'char *'
>  static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct device *dev,
>              ^~~~~~~~~~~~~~~~~~~~
> ../drivers/platform/x86/intel_pmc_core.c:1329:53: warning: passing argument 5 of 'pmc_core_lpm_display' makes pointer from integer without a cast [-Wint-conversion]
>    pmc_core_lpm_display(pmcdev, dev, NULL, "STATUS", offset, maps);
>                                                      ^~~~~~
> ../drivers/platform/x86/intel_pmc_core.c:977:13: note: expected 'const char *' but argument is of type 'int'
>  static void pmc_core_lpm_display(struct pmc_dev *pmcdev, struct device *dev,
>              ^~~~~~~~~~~~~~~~~~~~

Thank you, it should be fixed in today's Linux Next.

-- 
With Best Regards,
Andy Shevchenko
