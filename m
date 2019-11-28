Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45D9A10C5F2
	for <lists+linux-next@lfdr.de>; Thu, 28 Nov 2019 10:26:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbfK1J0R (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 28 Nov 2019 04:26:17 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:45304 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726092AbfK1J0R (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Thu, 28 Nov 2019 04:26:17 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id xAS9M97v009928;
        Thu, 28 Nov 2019 10:26:00 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=vZzFNFGxRNeBrJEgNIX5zBSPJdfqnKxuYYBdP4Fi1aw=;
 b=h+Icqx7Y27HCNOQ/58mkAfVw91CWyjhGrkjFZnL7g0fEMlP0tol6ivKygHTx3zrUo/RL
 MEL1Djd2hooXAaC1oZhWcXxXo+5PhSjbnke4PInkwj88wRG0l8DHYEf1fwBj2bGA1iDx
 Yb+8+OpV7jQiaTFGH7d3vXXAZZx8oUR1ljhzuWL8lGCk1mvR1cWh7DlETGVAXDzF0i2p
 PBnVPlqEvo5x+FrUaTp14EZYUHF956yJphlczWnIsao0zMfVW7oNoyj0H/TAIx13ZpKt
 GbYaA09K+AxkbLqwIepadmy57sO4zgqOd/Dy7GT15O8YDAmLweLybwg0CdUZDryiG/Ni kQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx08-00178001.pphosted.com with ESMTP id 2whcxygyx2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 28 Nov 2019 10:26:00 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id C487D10002A;
        Thu, 28 Nov 2019 10:25:59 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4146C2ACE5E;
        Thu, 28 Nov 2019 10:25:59 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.49) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 28 Nov
 2019 10:25:58 +0100
Subject: Re: linux-next: manual merge of the mailbox tree with the devicetree
 tree
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Rob Herring <robherring2@gmail.com>
CC:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Fabien Dessenne <fabien.dessenne@st.com>
References: <20191128114127.0f1e3b06@canb.auug.org.au>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <bc59ac67-1278-def5-2c84-c73e8a4d39ef@st.com>
Date:   Thu, 28 Nov 2019 10:25:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191128114127.0f1e3b06@canb.auug.org.au>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG4NODE1.st.com (10.75.127.10) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-28_01:2019-11-28,2019-11-28 signatures=0
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

On 11/28/19 1:41 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the mailbox tree got a conflict in:
> 
>   Documentation/devicetree/bindings/mailbox/stm32-ipcc.txt
> 
> between commit:
> 
>   4360bf724483 ("dt-bindings: mailbox: convert stm32-ipcc to json-schema")
> 
> from the devicetree tree and commit:
> 
>   9b2cfd3fb09e ("dt-bindings: mailbox: stm32-ipcc: Updates for wakeup management")
> 
> from the mailbox tree.
> 
> I fixed it up (I just deleted the file - presumably there will need to be
> followup fixes to the json file) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
No extra patch needed, the wake up property is already integrated in the json file

Thanks for your solving the merge issue!

Regards
Arnaud 
