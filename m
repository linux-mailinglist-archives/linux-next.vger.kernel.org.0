Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1ECE92DD5AC
	for <lists+linux-next@lfdr.de>; Thu, 17 Dec 2020 18:07:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727543AbgLQRHF (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 17 Dec 2020 12:07:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727260AbgLQRHF (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 17 Dec 2020 12:07:05 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01EA6C061794
        for <linux-next@vger.kernel.org>; Thu, 17 Dec 2020 09:06:24 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id b8so9485863plx.0
        for <linux-next@vger.kernel.org>; Thu, 17 Dec 2020 09:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=6951Puc06AmaqAEBPElLdD0QTM50Q9SNBxDGt1eq6AA=;
        b=OlAOwwG6RML8tzpn4gizUuFj7jBhenVz44aFRQiINMhmr9fqly+rfRpe4rREZCn5VR
         1C5KKngQ3y6r9k/IyjpBwLZLCvU9s4G1SHJ3AStTfgfdC/CfvOUFnVEcjRPy+2pbe5gi
         ZqsAVUGMA30e1wfwGTT7VTDMoKFfwwYmMHu6LVds6jvC832ANqzYsWwwHGMaRIQ+LvJL
         0cV3vwlVbPYpZPz/VV17yY2F0CGdn94PbMpNisALuy/T0kynb9IaANXKLWUEP9r7B9e4
         y0guksGj1v1BaCR5eOnRyH3+tLS2ZbuKu/NQ++UpLDS/OF5ddymKmhUgxSUdCNvYR1aP
         koIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=6951Puc06AmaqAEBPElLdD0QTM50Q9SNBxDGt1eq6AA=;
        b=JEW2le/UkLceJ3fF07T0zFQqak9agcRNZ6oAGP3wjq1UYZdEMc2ZRuh0kled16fTN2
         eNQN0D7Rp8bS7NAQQ1PKqOAjeTmQrV2KeP4HtafxapWvUWSoTYiCBaYlZ0nSPmsqkF+8
         7LwQBAcHBo73wPVC0hApNvC7tw4XpvoFH5DaZekR/8iUUWpbYL/EhBJN/a5Vbu1LwbVe
         IdCF5x0uKfeeKjwcWhMpIvB3aK9MJdNWbpvarQi37vnGwQSkFqvZvmWLRhv1Zpw9xGAY
         hH7CnmiDBAS5ULSjBb6gIodbbDXNjj0CqpMVeGQKCFVWBjOhKtnMg5/M9r1gmi5MQXDb
         G83Q==
X-Gm-Message-State: AOAM533Yy5/LX/9xvP5UPiUslKQGhu3eyrj/JG7W44Wwf9pVsfNsUQai
        3yBZUa2EoVRX7doBBtBaE8Wtrg==
X-Google-Smtp-Source: ABdhPJz4fRjtRUnbNYEOV1MmeBr3tL+TSQv/Fxoxxc7mrkAVO3V5f8aweoIHuUikrLP9vcqeuKNywA==
X-Received: by 2002:a17:90b:691:: with SMTP id m17mr153805pjz.73.1608224784067;
        Thu, 17 Dec 2020 09:06:24 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id iq3sm5477816pjb.57.2020.12.17.09.06.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Dec 2020 09:06:23 -0800 (PST)
Date:   Thu, 17 Dec 2020 09:06:23 -0800 (PST)
X-Google-Original-Date: Thu, 17 Dec 2020 09:06:20 PST (-0800)
Subject:     Re: linux-next: manual merge of the akpm-current tree with the risc-v tree
In-Reply-To: <CAHp75VdVDZx_YzD5mwUqs=ezuy=Mt1s8UmWB3mg+MgMj5yqEkQ@mail.gmail.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>, brendanhiggins@google.com,
        skhan@linuxfoundation.org, Paul Walmsley <paul@pwsan.com>,
        akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com,
        linux-kernel@vger.kernel.org, linux-next@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     andy.shevchenko@gmail.com
Message-ID: <mhng-c1e9dc55-3185-4ee5-a8ab-faa751dcd41f@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Thu, 17 Dec 2020 01:40:51 PST (-0800), andy.shevchenko@gmail.com wrote:
> On Thu, Dec 17, 2020 at 3:28 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> Hi all,
>>
>> On Mon, 14 Dec 2020 20:21:07 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>> >
>> > Today's linux-next merge of the akpm-current tree got a conflict in:
>> >
>> >   lib/Makefile
>> >
>> > between commit:
>> >
>> >   527701eda5f1 ("lib: Add a generic version of devmem_is_allowed()")
>> >
>> > from the risc-v tree and commits:
>> >
>> >   8250e121c672 ("lib/list_kunit: follow new file name convention for KUnit tests")
>> >   17bf776cf09a ("lib/linear_ranges_kunit: follow new file name convention for KUnit tests")
>> >   23fa4e39ee62 ("lib/bits_kunit: follow new file name convention for KUnit tests")
>> >   1987f84faec6 ("lib/cmdline_kunit: add a new test suite for cmdline API")
>
> AFAIU Linus rejected the above patches. I hope kselftest/kunit tree
> can pick them up.
>
>> > diff --cc lib/Makefile
>> > index bcedd691ef63,dc623561ef9d..000000000000
>> > --- a/lib/Makefile
>> > +++ b/lib/Makefile
>> > @@@ -350,8 -350,7 +350,9 @@@ obj-$(CONFIG_PLDMFW) += pldmfw
>> >
>> >   # KUnit tests
>> >   obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
>> > - obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
>> > - obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
>> > - obj-$(CONFIG_BITS_TEST) += test_bits.o
>> > + obj-$(CONFIG_BITS_TEST) += bits_kunit.o
>> > + obj-$(CONFIG_CMDLINE_KUNIT_TEST) += cmdline_kunit.o
>> > + obj-$(CONFIG_LINEAR_RANGES_TEST) += linear_ranges_kunit.o
>> > + obj-$(CONFIG_LIST_KUNIT_TEST) += list_kunit.o
>> >  +
>> >  +obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
>>
>> This is now a conflict between the risc-v tree and Linus' tree.
>
> Yeah, and it's slightly different. Perhaps RISC-V tree can handle this
> by moving Makefile entry somewhere else in the file.

I was planning on just posting the merge conflict along with the PR, which I
was going to do this morning (though in practice that means this afternoon...
;)).  I'd been considering fixing this stuff as I was likely going to have to
rewrite history to sort out our boot bug, but as it's only manifesting on
old-ish QEMU versions I've decided that it's not really worth making it a
blocker.

If you think that's an issue then I'm happy to rewrite my history, but I do
generally try to stay away from that and for this sort of thing I've yet to
have any complaints.  I probably will put it up near the other GENERIC_LIB
stuff in my conflict resolution, though.
