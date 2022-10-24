Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5E6609E37
	for <lists+linux-next@lfdr.de>; Mon, 24 Oct 2022 11:46:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230426AbiJXJqX (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 24 Oct 2022 05:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230351AbiJXJqH (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 24 Oct 2022 05:46:07 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C31E511A03;
        Mon, 24 Oct 2022 02:45:23 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E92FAED1;
        Mon, 24 Oct 2022 02:45:28 -0700 (PDT)
Received: from [10.57.68.77] (unknown [10.57.68.77])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B4CB13F7B4;
        Mon, 24 Oct 2022 02:45:21 -0700 (PDT)
Message-ID: <17e9cb70-c36a-f120-0036-dc1eae4fa907@arm.com>
Date:   Mon, 24 Oct 2022 10:45:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: linux-next: build warnings after merge of the char-misc.current
 tree
To:     Greg KH <greg@kroah.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Arnd Bergmann <arnd@arndb.de>, James Clark <james.clark@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
References: <20221024135752.2b83af97@canb.auug.org.au>
 <Y1Yx/ioaPRA9YIzM@kroah.com>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <Y1Yx/ioaPRA9YIzM@kroah.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On 24/10/2022 07:34, Greg KH wrote:
> On Mon, Oct 24, 2022 at 01:57:52PM +1100, Stephen Rothwell wrote:
>> Hi all,
>>
>> After merging the char-misc.current tree, today's linux-next build
>> (arm64 defconfig) produced these warnings:
>>
>> drivers/hwtracing/coresight/coresight-cti-core.c: In functio
>> n 'cti_enable_hw':
>> drivers/hwtracing/coresight/coresight-cti-core.c:93:24: warning: unused variable 'dev' [-Wunused-variable]
>>     93 |         struct device *dev = &drvdata->csdev->dev;
>>        |                        ^~~
>> drivers/hwtracing/coresight/coresight-cti-core.c: In function 'cti_disable_hw':
>> drivers/hwtracing/coresight/coresight-cti-core.c:154:24: warning: unused variable 'dev' [-Wunused-variable]
>>    154 |         struct device *dev = &drvdata->csdev->dev;
>>        |                        ^~~
>>
>> Introduced by commit
>>
>>    665c157e0204 ("coresight: cti: Fix hang in cti_disable_hw()")
> 
> Thanks for the report, I have now reverted this in my tree.

Apologies ! I will fix this up and send it at rc2

Sorry!

Suzuki

> 
> greg k-h

