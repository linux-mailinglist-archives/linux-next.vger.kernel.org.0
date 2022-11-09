Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD90D622980
	for <lists+linux-next@lfdr.de>; Wed,  9 Nov 2022 12:04:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230310AbiKILEq (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Wed, 9 Nov 2022 06:04:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiKILEm (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Wed, 9 Nov 2022 06:04:42 -0500
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5A2717E10;
        Wed,  9 Nov 2022 03:04:39 -0800 (PST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A9AgNKL004644;
        Wed, 9 Nov 2022 11:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=zLuZjvEOZ0iv+LoeP2qRTIHYW8Xd/g5Pa30KvZWZBSk=;
 b=Hp0brgLWM/ZtD6kgipUwTbkClv2V0fJ4TEkbJI3OxC/Dulnjso9k6S/EpnaVS9G6kmzK
 6/thMPO1F+QuuXTJBSlERdr9Jw/piCEYV4vGDwnJs42pvVZarTi28OzuT90XjkVEKE/C
 nfPelpwxcIBSsDqrhm06trvTps+v36B69xrr7Qtun1hHTsmSNfn1sBmm/IZryovr5nu8
 Yvml1G5EhGw4wXoDGJ0B66+k9nweKP1W3XkJ3IcPRQXswGUPgKuc36veGjGBuThRsjOx
 xdQ7VxnV071iYyrNNcQVZAcEd+wYMGm8TbP7+UaTZZXzsrUMxQiHZ7RgYRs/dTKCfVu6 jw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3krapk0h1f-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Nov 2022 11:04:36 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
        by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A9B2mI9002396;
        Wed, 9 Nov 2022 11:04:33 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma03ams.nl.ibm.com with ESMTP id 3kngqgdjja-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 09 Nov 2022 11:04:33 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A9B4V2g36110820
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 9 Nov 2022 11:04:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 803B511C04C;
        Wed,  9 Nov 2022 11:04:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 767A511C052;
        Wed,  9 Nov 2022 11:04:30 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.28.188])
        by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
        Wed,  9 Nov 2022 11:04:30 +0000 (GMT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.200.110.1.12\))
Subject: Re: [6.1.0-rc4-next-20221108] Boot failure on powerpc
From:   Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <Y2t4/sELkmB4pn2p@zx2c4.com>
Date:   Wed, 9 Nov 2022 16:34:19 +0530
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-crypto@vger.kernel.org, linux-next@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <B8006950-2F4B-46C2-B27B-12ACD30C92C0@linux.ibm.com>
References: <E051ACF6-5282-49D1-9C60-BB2450569268@linux.ibm.com>
 <Y2t4/sELkmB4pn2p@zx2c4.com>
To:     "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3731.200.110.1.12)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zg_vEDRm1ime808mXlSyyUDCEQtvkyxE
X-Proofpoint-GUID: zg_vEDRm1ime808mXlSyyUDCEQtvkyxE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_04,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 phishscore=0
 mlxlogscore=933 priorityscore=1501 impostorscore=0 bulkscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090084
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org



> On 09-Nov-2022, at 3:25 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> 
> Should be fixed already in today's next.

Yup, thanks. next-20221109 boots successfully.

- Sachin 
