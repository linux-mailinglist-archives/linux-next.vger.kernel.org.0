Return-Path: <linux-next-owner@vger.kernel.org>
X-Original-To: lists+linux-next@lfdr.de
Delivered-To: lists+linux-next@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4F78BCAB
	for <lists+linux-next@lfdr.de>; Tue, 13 Aug 2019 17:10:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729723AbfHMPK5 (ORCPT <rfc822;lists+linux-next@lfdr.de>);
        Tue, 13 Aug 2019 11:10:57 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:49074 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729539AbfHMPK5 (ORCPT
        <rfc822;linux-next@vger.kernel.org>);
        Tue, 13 Aug 2019 11:10:57 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x7DErMH0118937
        for <linux-next@vger.kernel.org>; Tue, 13 Aug 2019 11:10:56 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2ubwm46ha8-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <linux-next@vger.kernel.org>; Tue, 13 Aug 2019 11:10:55 -0400
Received: from localhost
        by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-next@vger.kernel.org> from <gor@linux.ibm.com>;
        Tue, 13 Aug 2019 16:10:53 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
        by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted;
        (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
        Tue, 13 Aug 2019 16:10:50 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
        by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id x7DFAolV37552470
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Aug 2019 15:10:50 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id C651DAE053;
        Tue, 13 Aug 2019 15:10:49 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
        by IMSVA (Postfix) with ESMTP id 4DBD4AE056;
        Tue, 13 Aug 2019 15:10:49 +0000 (GMT)
Received: from localhost (unknown [9.152.212.112])
        by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
        Tue, 13 Aug 2019 15:10:49 +0000 (GMT)
Date:   Tue, 13 Aug 2019 17:10:48 +0200
From:   Vasily Gorbik <gor@linux.ibm.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Matthew Garrett <matthewgarrett@google.com>,
        James Morris <jmorris@namei.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: linux-next: Tree for Aug 13
References: <20190813191924.7c5310dd@canb.auug.org.au>
 <your-ad-here.call-01565700115-ext-9407@work.hours>
 <20190813105645.4ffba70c@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190813105645.4ffba70c@gandalf.local.home>
X-TM-AS-GCONF: 00
x-cbid: 19081315-0008-0000-0000-000003088E8B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19081315-0009-0000-0000-00004A26A1AB
Message-Id: <your-ad-here.call-01565709048-ext-0789@work.hours>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:,, definitions=2019-08-13_05:,,
 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=939 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908130157
Sender: linux-next-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-next.vger.kernel.org>
X-Mailing-List: linux-next@vger.kernel.org

On Tue, Aug 13, 2019 at 10:56:45AM -0400, Steven Rostedt wrote:
> 
> This looks related to what Marek posted.
> 
>   https://lore.kernel.org/linux-security-module/3028ed35-3b6d-459f-f3c8-103c5636fe95@samsung.com/
> 
> Care to apply the change he suggested to see if it fixes the issue for
> you. If it does, Marek, can you make an official patch?
> 
> -- Steve

Right, same issue - same fix. Oh well, at least I got a bit more
familiar with the code.

--
⣿⣿⣿⣿⢋⡀⣀⠹⣿⣿⣿⣿
⣿⣿⣿⣿⠠⣶⡦⠀⣿⣿⣿⣿
⣿⣿⣿⠏⣴⣮⣴⣧⠈⢿⣿⣿
⣿⣿⡏⢰⣿⠖⣠⣿⡆⠈⣿⣿
⣿⢛⣵⣄⠙⣶⣶⡟⣅⣠⠹⣿
⣿⣜⣛⠻⢎⣉⣉⣀⠿⣫⣵⣿

