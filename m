Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E700C2DA519
	for <lists+linux-next@lfdr.de>; Tue, 15 Dec 2020 01:57:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbgLOA4T (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 14 Dec 2020 19:56:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728482AbgLOA4M (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 14 Dec 2020 19:56:12 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A49CC061793
        for <linux-next@vger.kernel.org>; Mon, 14 Dec 2020 16:55:32 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id h186so2937736pfe.0
        for <linux-next@vger.kernel.org>; Mon, 14 Dec 2020 16:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=8UGCbk740l8AwsQmKCSzWqwpxPJ2TRvHUyI785jzr+s=;
        b=C3Eu9v/JC+HEc++CyyC2LiTQeYcR3zbEurj+/YK5BAEMvh0BXC3mUkLvk2d+Fu2rhI
         1qKOd8DanyFu1rDT6Wj2OLOqf20e5WrQPBldRgxAdJeHFcOrqPj9rOsQ9lN1mOgoh41a
         jKNuMp0PJdmltMyJj0YW35aguOXeaY0UaFl6noQLOeh1LsIy8kOG1nUQL1B6L104DTsJ
         N7VgZQ01Qa5GjPYs4hn6ToHtz482VKxhtTt+ECOfA2ZSs/hxBRviX+1iJaA1koViTUAM
         GvM5EpDxPo8LM5LVxJAKy/ibvhj29hwev4QiKdvN2LM/PIYcyBeeEp4y7KtWA6P+XH0i
         6fWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=8UGCbk740l8AwsQmKCSzWqwpxPJ2TRvHUyI785jzr+s=;
        b=Zse66LkpCodsdVbZPRB/iX0gJrIIM/jpYQE1gKDnKTyZ0/7A10b2oLZL8gpAEgW89N
         siAdL20y5HJS+wAFi8+c9jD2Aa8mS7OeNHX0wLyK4TDcjclZHqGDtsKBw2DhqgWz43ky
         sBfjNQylqelskjXDQLks7o9mnVGDXNNVtgFMJt99ox1Mzh6CFWGEviju5r1HKq0XE8EY
         RguRRp4eenpjlKfVvx7L/kHhSSpRtnjLywCQNVjiZqIpR+qkkeYfbys8uWJVvLFU3970
         0oIHFFUylv67MxvpFHPF2LMUmhjbtgD69cDhImSu3DHOuFIHx/G7eg0EKKa1BwkdqiGN
         ypGw==
X-Gm-Message-State: AOAM533psRLJ5Hg/P3jnyfSn3jjTz6P8aFTqo6ZMH2vNHIO1mbbAMee+
        XE8dN8iVhWvOkTh4OtWKmQEuvg==
X-Google-Smtp-Source: ABdhPJxTYioF4+57NaOOcmZIW9bmvWR6Lt30hsVq0Sotszns7R3IxlPnc3sv/UxSt3vyNPWyG2LvQQ==
X-Received: by 2002:a65:5bcd:: with SMTP id o13mr26774344pgr.81.1607993731614;
        Mon, 14 Dec 2020 16:55:31 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id l13sm14976045pgq.51.2020.12.14.16.55.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Dec 2020 16:55:30 -0800 (PST)
Date:   Mon, 14 Dec 2020 16:55:30 -0800 (PST)
X-Google-Original-Date: Mon, 14 Dec 2020 16:55:25 PST (-0800)
Subject:     Re: linux-next: manual merge of the akpm-current tree with the risc-v tree
In-Reply-To: <20201214173747.GO4077@smile.fi.intel.com>
CC:     Stephen Rothwell <sfr@canb.auug.org.au>, akpm@linux-foundation.org,
        Paul Walmsley <paul@pwsan.com>, linux-kernel@vger.kernel.org,
        linux-next@vger.kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     andriy.shevchenko@linux.intel.com
Message-ID: <mhng-ad8a7c35-eb36-4a7d-9eff-996c707a48e3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, 14 Dec 2020 09:37:47 PST (-0800), andriy.shevchenko@linux.intel.com wrote:
> On Mon, Dec 14, 2020 at 08:21:07PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> Today's linux-next merge of the akpm-current tree got a conflict in:
>>
>>   lib/Makefile
>>
>> between commit:
>>
>>   527701eda5f1 ("lib: Add a generic version of devmem_is_allowed()")
>>
>> from the risc-v tree and commits:
>>
>>   8250e121c672 ("lib/list_kunit: follow new file name convention for KUnit tests")
>>   17bf776cf09a ("lib/linear_ranges_kunit: follow new file name convention for KUnit tests")
>>   23fa4e39ee62 ("lib/bits_kunit: follow new file name convention for KUnit tests")
>>   1987f84faec6 ("lib/cmdline_kunit: add a new test suite for cmdline API")
>>
>> from the akpm-current tree.
>>
>> I fixed it up (see below) and can carry the fix as necessary. This
>> is now fixed as far as linux-next is concerned, but any non trivial
>> conflicts should be mentioned to your upstream maintainer when your tree
>> is submitted for merging.  You may also want to consider cooperating
>> with the maintainer of the conflicting tree to minimise any particularly
>> complex conflicts.
>
> Looks good enough (*) to me, thanks!
>
> *) I think we might group that new line with an existing one(s) of the same
> level (GENERIC_LIB) but it doesn't really matter.

I went back and forth on that one: it's got the same Kconfig name, but it's not
a libgcc function.  Maybe we shouldn't have had the "_LIB" in there?  I don't
remember if that was meant to stand for libgcc or lib/...

I'm happy to just re-spin my patch to avoid the conflict.  It's near/at the top
of my tree, so it's not a big deal, but I'm also just OK merging second and
pointing out the conflict.  Unless you care one way or the other I'll just do
whatever ends up being easier for me :)

>> --
>> Cheers,
>> Stephen Rothwell
>>
>> diff --cc lib/Makefile
>> index bcedd691ef63,dc623561ef9d..000000000000
>> --- a/lib/Makefile
>> +++ b/lib/Makefile
>> @@@ -350,8 -350,7 +350,9 @@@ obj-$(CONFIG_PLDMFW) += pldmfw
>>
>>   # KUnit tests
>>   obj-$(CONFIG_BITFIELD_KUNIT) += bitfield_kunit.o
>> - obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
>> - obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
>> - obj-$(CONFIG_BITS_TEST) += test_bits.o
>> + obj-$(CONFIG_BITS_TEST) += bits_kunit.o
>> + obj-$(CONFIG_CMDLINE_KUNIT_TEST) += cmdline_kunit.o
>> + obj-$(CONFIG_LINEAR_RANGES_TEST) += linear_ranges_kunit.o
>> + obj-$(CONFIG_LIST_KUNIT_TEST) += list_kunit.o
>>  +
>>  +obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
