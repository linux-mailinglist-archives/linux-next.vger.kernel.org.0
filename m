Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 047707D0C29
	for <lists+linux-next@lfdr.de>; Fri, 20 Oct 2023 11:41:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376642AbjJTJlu (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Fri, 20 Oct 2023 05:41:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376629AbjJTJlt (ORCPT
        <rfc822;linux-next@vger.kernel.org>); Fri, 20 Oct 2023 05:41:49 -0400
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D180C2
        for <linux-next@vger.kernel.org>; Fri, 20 Oct 2023 02:41:48 -0700 (PDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39K9TEEg031052;
        Fri, 20 Oct 2023 09:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 content-transfer-encoding : in-reply-to; s=pp1;
 bh=22rj3d/7r477kH95SPEBpwogDxIQGiJ9YLNGnpcvdl0=;
 b=YqntX+dEpJq1g2Wpa53SmOKHGkzgf8xysEpmudHG3XfzgvPN5BrkldCWtV0aycamLjC4
 xx4/RPfwfsJ4a5uZ8gTdFl1YIKAbPMXeCBDOA2AOqtPMv4/UsD4yOpHYHSY0zWXljKuk
 ilVOGqkuklD4XE5B5Fr/4vYy3EKCMjHF2nVEVEFEcc/wg75tRgBQ3HmP9ZrSooVgkvGU
 DsgynDy055Kmws8q/F8LR9z4ehCoRyD9RqLvOkL64jWSfo4wbv5NrE+gGnjGjDiliCGK
 6Gek9SlTLN7a1mwyn2XsB2K/37TaKRTXJ4a8eXporj/KvslQMazbz+NuuBtMh+Syk22Y LA== 
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
        by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tupy68fv4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 20 Oct 2023 09:41:40 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
        by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39K9BJMd019377;
        Fri, 20 Oct 2023 09:35:56 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
        by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tuc453n98-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 20 Oct 2023 09:35:56 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
        by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39K9ZrCa47972754
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 20 Oct 2023 09:35:53 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 8C33B2004D;
        Fri, 20 Oct 2023 09:35:53 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id D161820043;
        Fri, 20 Oct 2023 09:35:52 +0000 (GMT)
Received: from localhost (unknown [9.171.18.113])
        by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
        Fri, 20 Oct 2023 09:35:52 +0000 (GMT)
Date:   Fri, 20 Oct 2023 11:35:51 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     =?utf-8?B?SsO2cmcgUsO2ZGVs?= <jroedel@suse.de>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Niklas Schnelle <schnelle@linux.ibm.com>,
        Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: Upcoming merge conflict between s390 fixes and iommu trees
Message-ID: <your-ad-here.call-01697794551-ext-4002@work.hours>
References: <your-ad-here.call-01697728651-ext-4593@work.hours>
 <0D650B3E-5E4D-406E-B5B5-E9135B97696B@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0D650B3E-5E4D-406E-B5B5-E9135B97696B@suse.de>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Wq6hTgXvBKCXxE4lmoR5oCs2Lh_KHKM6
X-Proofpoint-ORIG-GUID: Wq6hTgXvBKCXxE4lmoR5oCs2Lh_KHKM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_07,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 mlxlogscore=658 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310200079
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Fri, Oct 20, 2023 at 10:26:29AM +0200, Jörg Rödel wrote:
> > Am 19.10.2023 um 17:17 schrieb Vasily Gorbik <gor@linux.ibm.com>:
> > 
> > The latter commit removes arch/s390/pci/pci_dma.c, so that's
> > the way to go for the conflict resolution. Joerg, I believe it's your
> > decision whether you would like to mention this trivial merge conflict in
> > your pull request to Linus later.
> 
> Thanks for the heads-up, I will probably resolve that in my merge-commit that will be the iommu/next branch, so upstream shouldn’t notice. I guess the fix will be in rc7?

That's the plan, I will send my pull request for rc7 tomorrow.
