Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DBB5F4EA331
	for <lists+linux-next@lfdr.de>; Tue, 29 Mar 2022 00:50:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbiC1Wn4 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Mon, 28 Mar 2022 18:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiC1Wnz (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Mon, 28 Mar 2022 18:43:55 -0400
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9299C3E0E1;
        Mon, 28 Mar 2022 15:42:14 -0700 (PDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22SIoBSJ022626;
        Mon, 28 Mar 2022 21:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : content-type : in-reply-to :
 mime-version; s=pp1; bh=NnyKKtxu4F/uRqTniTyXZXQEPsrsBOiKJquWbfplKjU=;
 b=UgJPFOZOqqrh5V3eC37/2lYWrF20vzq8imS+3r8KNdMzDCAtnxpZ4mLyclvc1dE+qTS/
 u4F0g6S2V/g688teMV4y3IUrrbv8Epfdj/Mz9K8OfQ1zvBMKIAfZQYnVjdgH5j3dMgMx
 hnqdK8yp6bbC70ouEdejO56PIZaSGGazw5UHk9dShfLOZtCfb2xZHzNNKkBecheCB1TY
 PF1YzQqPjdnGyDz6+mxb8Dtt0mKb3TIYvKzQSnzNu9P0JdPoR8afG5x2gcNG/G73Su0J
 90YGP6Zyd8oehcCjiMyCwrpkv8X2/G/MEyeN0KMoFjJlN4AurX2m3eLzIcB0s3DVTdOQ Fw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
        by mx0b-001b2d01.pphosted.com with ESMTP id 3f3j6pumfn-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Mar 2022 21:44:33 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
        by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22SLhVBJ027436;
        Mon, 28 Mar 2022 21:44:32 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
        by ppma05fra.de.ibm.com with ESMTP id 3f1tf8v1q7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 28 Mar 2022 21:44:32 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
        by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 22SLiS6q32965062
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 28 Mar 2022 21:44:28 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 9BA02A4051;
        Mon, 28 Mar 2022 21:44:28 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 473E8A404D;
        Mon, 28 Mar 2022 21:44:28 +0000 (GMT)
Received: from localhost (unknown [9.171.75.40])
        by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Mon, 28 Mar 2022 21:44:28 +0000 (GMT)
Date:   Mon, 28 Mar 2022 23:44:26 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Heiko Carstens <hca@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        linux-s390@vger.kernel.org, linux-next@vger.kernel.org,
        llvm@lists.linux.dev
Subject: Re: s390 defconfig fails to build after
 4afeb670710efa5cd5ed8b1d9f2d22d6ce332bcc
Message-ID: <your-ad-here.call-01648503866-ext-8764@work.hours>
References: <YkH/rRikE2CilpqU@dev-arch.thelio-3990X>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YkH/rRikE2CilpqU@dev-arch.thelio-3990X>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 53qM4UR7Q3VuN8sDrnYgv1aTgYu-X5lx
X-Proofpoint-ORIG-GUID: 53qM4UR7Q3VuN8sDrnYgv1aTgYu-X5lx
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-28_10,2022-03-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=756
 mlxscore=0 malwarescore=0 clxscore=1011 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203280116
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Mon, Mar 28, 2022 at 11:34:21AM -0700, Nathan Chancellor wrote:
> Hi all,
> 
> Apologies if this has been reported or fixed already, I did not see a
> report when searching lore.kernel.org and it is reproducible as of
> commit 7dcfe50f58d2 ("s390/pci: rename get_zdev_by_bus() to
> zdev_from_bus()") in s390/linux.git.
> 
> Our continuous integration noticed a build failure on next-20220328 in
> arch/s390/kernel/entry.S, which does not appear to be compiler specific,
> as I can reproduce this with GCC easily:
> 
> https://builds.tuxbuild.com/2716QwFVG9408TJ43vkEc7trVCI/build.log
> 
> $ make -skj"$(nproc)" ARCH=s390 CROSS_COMPILE=s390x-linux-gnu- defconfig arch/s390/kernel/entry.o
> arch/s390/kernel/entry.S: Assembler messages:
> arch/s390/kernel/entry.S:335: Error: Unrecognized opcode: `jgnop'
> arch/s390/kernel/entry.S:493: Error: Unrecognized opcode: `jgnop'
> arch/s390/kernel/entry.S:494: Error: Unrecognized opcode: `jgnop'

Thank you for reporting this!

jgnop mnemonic has been introduced with binutils commit
b10b530a4566 ("IBM Z: Add support for HLASM extended mnemonics")

and is part of binutils-2_36 and newer.

I fixed it by using old "brcl 0,0" alternative here:
https://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git/commit/?h=features&id=faf79934e65aff90284725518a5ec3c2241c65ae
