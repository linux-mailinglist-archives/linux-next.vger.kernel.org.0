Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C32510686B
	for <lists+linux-next@lfdr.de>; Fri, 22 Nov 2019 09:55:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfKVIzz (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 22 Nov 2019 03:55:55 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:42502 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726364AbfKVIzz (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Fri, 22 Nov 2019 03:55:55 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAM8lgCO032709;
        Fri, 22 Nov 2019 09:55:40 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=2t+DGb8B7d02zRXJcqDpsb79XxFrVWCy01dkaYrHwQ0=;
 b=so3C8vvgsOwajmqyJ+NTShdaWmoFLj2ABImnEGaAm7wt06mM3/mRolS0z1otdGho+uuT
 m8WdLVgaJ6EWlWiuNjzoxFrjXqQZt5rNeqNJAMeNhFVXc9cwONHjh56Nb+zjg1CzOlGe
 mqGsvqIIQLtqJ3aESmCxUOv7zLbH7Q5lZIQTi0EqlmVGe6Mn8/rj48BDuuI32oYLRrUr
 jHgGGhPCD46Cs0+Q7Bt9Z2aamASRmYpHNBLxHtQw+V5DtR8eBSl7ndoajkGRoEgbpHKO
 GwztFYFI551fyFRlv7IStWrKtH57LjJrItf0Wrr32Vc1ThjncNICGY9iOhQhjNlWDYs+ KA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2wa9uvr6t4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Nov 2019 09:55:40 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E8D14100039;
        Fri, 22 Nov 2019 09:55:38 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 64EA52B05AC;
        Fri, 22 Nov 2019 09:55:38 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.51) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 22 Nov
 2019 09:55:37 +0100
Subject: Re: linux-next: manual merge of the rpmsg tree with the devicetree
 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robherring2@gmail.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Fabien Dessenne <fabien.dessenne@st.com>
References: <20191122145018.5f8a3187@canb.auug.org.au>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <0686d5b9-79e2-d953-3053-661fd90dfb2e@st.com>
Date:   Fri, 22 Nov 2019 09:55:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191122145018.5f8a3187@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.51]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-22_01:2019-11-21,2019-11-22 signatures=0
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

Thanks for the information. So i need to send an extra patch to add the missing
property in the yaml file
Not critical as this new property is not in the DTS file for the time being,
dtbs_check does not fail  

Regards
Arnaud


On 11/22/19 4:50 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the rpmsg tree got a conflict in:
> 
>   Documentation/devicetree/bindings/remoteproc/stm32-rproc.txt
> 
> between commit:
> 
>   34376eb1b084 ("dt-bindings: remoteproc: convert stm32-rproc to json-schema")
> 
> from the devicetree tree and commit:
> 
>   14ea1d04ed0f ("dt-bindings: remoteproc: stm32: add wakeup-source")
> 
> from the rpmsg tree.
> 
> I fixed it up (I just deleted the file - more updates may be required)
> and can carry the fix as necessary. This is now fixed as far as linux-next
> is concerned, but any non trivial conflicts should be mentioned to your
> upstream maintainer when your tree is submitted for merging.  You may
> also want to consider cooperating with the maintainer of the conflicting
> tree to minimise any particularly complex conflicts.
> 
