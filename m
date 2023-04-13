Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 485B96E1240
	for <lists+linux-next@lfdr.de>; Thu, 13 Apr 2023 18:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjDMQ1k (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 13 Apr 2023 12:27:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230251AbjDMQ1f (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 13 Apr 2023 12:27:35 -0400
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27C70AD27;
        Thu, 13 Apr 2023 09:27:31 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=hsiangkao@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0Vg0L.NG_1681403248;
Received: from 192.168.3.7(mailfrom:hsiangkao@linux.alibaba.com fp:SMTPD_---0Vg0L.NG_1681403248)
          by smtp.aliyun-inc.com;
          Fri, 14 Apr 2023 00:27:29 +0800
Message-ID: <c52808f1-0f4d-9bc3-9faa-0e262d28dac1@linux.alibaba.com>
Date:   Fri, 14 Apr 2023 00:27:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: linux-next: manual merge of the erofs tree with the vfs-idmapping
 tree
To:     Mark Brown <broonie@kernel.org>
Cc:     Gao Xiang <xiang@kernel.org>,
        Christian Brauner <brauner@kernel.org>,
        Jingbo Xu <jefflexu@linux.alibaba.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20230413144651.3519980-1-broonie@kernel.org>
 <4f9fdec2-cc2a-4bc7-9ddc-87809395f493@sirena.org.uk>
 <699f01a7-8c0e-98d9-d2c7-eaf08552f543@linux.alibaba.com>
 <664140af-3d95-416c-8f89-cad7beeaac19@sirena.org.uk>
From:   Gao Xiang <hsiangkao@linux.alibaba.com>
In-Reply-To: <664140af-3d95-416c-8f89-cad7beeaac19@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-11.0 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
        USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



On 2023/4/14 00:23, Mark Brown wrote:
> On Fri, Apr 14, 2023 at 12:16:46AM +0800, Gao Xiang wrote:
> 
>> Thanks.  Actually I didn't update the corresponind xattr patches (just
>> rebase some older commits, also I'd like to avoid in the future, but
>> sometimes it's impossible at least if some RVB is added...)
> 
>> I think it could be resolved as before by Stephen:
>> https://lore.kernel.org/r/20230412101942.75e3efa9@canb.auug.org.au
> 
>> And which looks the same as below:
> 
> Probably some context changed which caused me to have to reresolve the
> conflict?  Or perhaps just rerere not syncing properly from Stephen's
> work.

Not sure.. I didn't change the file itself.

Anyway, thanks for the efforts and time!

Thanks,
Gao Xiang
