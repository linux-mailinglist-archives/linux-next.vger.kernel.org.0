Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0F324563005
	for <lists+linux-next@lfdr.de>; Fri,  1 Jul 2022 11:28:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235616AbiGAJ2Z (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 1 Jul 2022 05:28:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46272 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235712AbiGAJ2I (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 1 Jul 2022 05:28:08 -0400
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD18D1C9;
        Fri,  1 Jul 2022 02:28:06 -0700 (PDT)
Received: from fraeml713-chm.china.huawei.com (unknown [172.18.147.207])
        by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LZ8v61hJHz6F97r;
        Fri,  1 Jul 2022 17:25:38 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml713-chm.china.huawei.com (10.206.15.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 1 Jul 2022 11:28:04 +0200
Received: from localhost (10.81.215.232) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 1 Jul
 2022 10:28:03 +0100
Date:   Fri, 1 Jul 2022 10:28:01 +0100
From:   Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Linux Next Mailing List" <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warning after merge of the iio tree
Message-ID: <20220701102801.00001dff@Huawei.com>
In-Reply-To: <20220701182849.124d8cd1@canb.auug.org.au>
References: <20220701152944.27539407@canb.auug.org.au>
        <20220701182849.124d8cd1@canb.auug.org.au>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.215.232]
X-ClientProxiedBy: lhreml723-chm.china.huawei.com (10.201.108.74) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, 1 Jul 2022 18:28:49 +1000
Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> On Fri, 1 Jul 2022 15:29:44 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> \> 
> > After merging the iio tree, today's linux-next build (x86_64 allmodconfig)
> > produced this warning:
> > 
> > WARNING: modpost: module qcom-spmi-adc-tm5 uses symbol qcom_adc_tm5_temp_volt_scale from namespace IIO_QCOM_VADC, but does not import it.
> > WARNING: modpost: module qcom-spmi-adc-tm5 uses symbol qcom_adc5_prescaling_from_dt from namespace IIO_QCOM_VADC, but does not import it.
> > WARNING: modpost: module qcom-spmi-adc-tm5 uses symbol qcom_adc5_hw_settle_time_from_dt from namespace IIO_QCOM_VADC, but does not import it.
> > WARNING: modpost: module qcom-spmi-adc-tm5 uses symbol qcom_adc5_avg_samples_from_dt from namespace IIO_QCOM_VADC, but does not import it.
> > WARNING: modpost: module qcom-spmi-adc-tm5 uses symbol qcom_adc5_decimation_from_dt from namespace IIO_QCOM_VADC, but does not import it.
> > 
> > Introduced by commit
> > 
> >   ec9b269f61cc ("iio: adc: qcom-vadc: Move symbol exports to IIO_QCOM_VADC namespace")  
> 
> This became a build failure in the arm64 defconfig build, so I have
> reverted that commit for today.
> 

Sorry about that. I'm guessing some commits crossed and it didn't show
in my local build tests or 0-day. Will fix it up later today.

Thanks,

Jonathan
