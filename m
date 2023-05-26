Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CDBA71214E
	for <lists+linux-next@lfdr.de>; Fri, 26 May 2023 09:42:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242276AbjEZHmH (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 26 May 2023 03:42:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236934AbjEZHmG (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 26 May 2023 03:42:06 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C546B6;
        Fri, 26 May 2023 00:42:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1DB7763F38;
        Fri, 26 May 2023 07:42:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B414C433EF;
        Fri, 26 May 2023 07:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1685086924;
        bh=CGmOzSnToxEh6t7Vd3qUTrp6JrJzLGRbWucQIhkrDL8=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=ZhdEgCsQ+tY/Sauzqi/d9RfxFM0MM60I/mzfPYrhlMTCG1E9gdn2dz673uQ7yrBzm
         BdZRNjd7RtpjBERFAVLi7NCEPEL3IcL1Br2tCXmsk5R2PPM10wCJ0NZxi8JJTo3n/o
         SDtVJ2prsrbE75UtWNF04q0WfO9zvRV4S5UAHl/wPtlH+CdGlkCsv8yxQCnkAjSyqm
         c1fP4OcYewPYdc47Bfmi5xqY0k4ON8pugMkWrldJjYAbQz9JnPyDZl3Y38wB6SQ8wX
         WE+79MqdkyvLVGPJpj2YJ7bEnFM+WvqovN0NH06M4C8vWJeB2DCa19Z+dpyAoa3DEc
         AOMvTYRiBKUVg==
Message-ID: <97ffe91e-bb31-cceb-fb7e-8f7a2252734f@kernel.org>
Date:   Fri, 26 May 2023 16:42:02 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: ioprio_set can take 8 as the PROCESS CLASS_BE ioprio value
Content-Language: en-US
To:     Murphy Zhou <jencce.kernel@gmail.com>, linux-block@vger.kernel.org,
        Linux-Next <linux-next@vger.kernel.org>
References: <CADJHv_sedgbfxvZkKHjC6quKvxR+E54noFCVF93MvhyK6bwRoA@mail.gmail.com>
From:   Damien Le Moal <dlemoal@kernel.org>
Organization: Western Digital Research
In-Reply-To: <CADJHv_sedgbfxvZkKHjC6quKvxR+E54noFCVF93MvhyK6bwRoA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 5/26/23 16:27, Murphy Zhou wrote:
> Hi Damien,
> 
> Since these commits:
> 
>   scsi: block: Introduce ioprio hints
>   scsi: block: ioprio: Clean up interface definition
> 
> go into linux-next tree, ioprio_set can take the value of 8
> as the PROCESS CLASS_BE ioprio parameter, returning
> success but actually it is setting to 0 due to the mask roundup.
> 
> The LTP test case ioprio_set03[1] covers this boundary value
> testing, which starts to fail since then.
> 
> This does not look as expected. Could you help to take a look?

Before the patches, the ioprio level of 8 could indeed be set, but that was
actually totally meaningless since the kernel components that use the priority
level all are limited to the range [0..7]. And why the level value 8 could be
seen, the effective level would have been 0. So at least, with the changes, we
are not lying to the user...

I am not sure what this ioprio_set03 test is trying to check.

> 
> Thanks,
> Murphy
> 
> [1] https://github.com/linux-test-project/ltp/blob/master/testcases/kernel/syscalls/ioprio/ioprio_set03.c

-- 
Damien Le Moal
Western Digital Research

