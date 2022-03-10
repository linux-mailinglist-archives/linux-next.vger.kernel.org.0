Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A11D4D512A
	for <lists+linux-next@lfdr.de>; Thu, 10 Mar 2022 19:07:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245434AbiCJSID (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Thu, 10 Mar 2022 13:08:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245389AbiCJSH5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Thu, 10 Mar 2022 13:07:57 -0500
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBC77190B65
        for <linux-next@vger.kernel.org>; Thu, 10 Mar 2022 10:06:56 -0800 (PST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AHckXG013699;
        Thu, 10 Mar 2022 18:06:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : content-type : mime-version; s=pp1;
 bh=NOBkRk3oJfixuXhuFGX3zrFDTL30ywW8Dkqylr06kpk=;
 b=RvLLxKaL4TrlZPY7Cy8sUy3LhRQnojRFa03L3xLDYCh42f72OB46pBQO4zJ9HPwUBvjl
 2LYLe3IbNWCzluGct9uuaLfNJeJxMj6ezl4en2511mq/psTDSfKoTwtxIER3afh22FKf
 ppDRg2pkVVR12A4TVkB4nEofD0HYvOYWyVb4N3Sk17t0FikRmZtF35kWofy0/k4ArQ3D
 3r2UL4T45/D9IXTeUUcoePim2FNgdMSDkSpzpkaB34h1EZEHjgoL8Beo57PiQT03wEcR
 FZOyqNRWTYcZvLoevlIW7o/MpgyGRDTXDM8bz/jpAiCpYH2K5Fwo7EF4wtCOC4n5GmRs rw== 
Received: from pps.reinject (localhost [127.0.0.1])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3epwxff8x2-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Mar 2022 18:06:49 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
        by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AI6AnH001904;
        Thu, 10 Mar 2022 18:06:49 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
        by mx0a-001b2d01.pphosted.com with ESMTP id 3epwxff8wq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Mar 2022 18:06:49 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
        by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AHrAt3018291;
        Thu, 10 Mar 2022 18:06:47 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
        by ppma04fra.de.ibm.com with ESMTP id 3ep8c3vvda-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 10 Mar 2022 18:06:47 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
        by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 22AHtTfC43974962
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 10 Mar 2022 17:55:29 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id E5D3F4203F;
        Thu, 10 Mar 2022 18:06:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id A629D42045;
        Thu, 10 Mar 2022 18:06:43 +0000 (GMT)
Received: from localhost (unknown [9.171.46.33])
        by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Thu, 10 Mar 2022 18:06:43 +0000 (GMT)
Date:   Thu, 10 Mar 2022 19:06:42 +0100
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux Next Mailing List <linux-next@vger.kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Paolo Bonzini <pbonzini@redhat.com>
Subject: Upcoming merge conflict between s390 and kvm / kvms390 trees
Message-ID: <your-ad-here.call-01646935602-ext-2264@work.hours>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UmSkPjz9emsF8fEqeAbt08NL2FlALcn9
X-Proofpoint-ORIG-GUID: d8irN9DFxUOgfeuP6RkLMmgue6urckIS
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_07,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1011 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=690 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203100093
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

Hi Stephen,

updating s390 tree for linux-next today I had to include a change
which is already present in kvm tree:

1a82f6ab2365 ("s390/uaccess: Add copy_from/to_user_key functions")

it will get conflicts in arch/s390/lib/uaccess.c with the changes from
s390 tree now:

432b1cc78e98 ("s390/uaccess: Add copy_from/to_user_key functions")
4efd417f298b ("s390: raise minimum supported machine generation to z10")
731efc9613ee ("s390: convert ".insn" encoding to instruction names")

please simply take the version from s390 tree (removing bunch of code from
arch/s390/lib/uaccess.c file).

So that with regular order of merges (s390/for-next comes before kvm/next)
kvm/next merge will not bring any new changes to arch/s390/lib/uaccess.c

cat Next/merge.log | grep -i 'Merge .*\(kvm\|s390\)' | grep -v arm
$ git merge -m Merge branch 'fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git s390-fixes/fixes
$ git merge -m Merge branch 'master' of git://git.kernel.org/pub/scm/virt/kvm/kvm.git kvm-fixes/master
$ git merge -m Merge branch 'master' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git kvms390-fixes/master
$ git merge -m Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/s390/linux.git s390/for-next
$ git merge -m Merge branch 'next' of git://git.kernel.org/pub/scm/virt/kvm/kvm.git kvm/next
$ git merge -m Merge branch 'next' of git://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git kvms390/next

Thank you
